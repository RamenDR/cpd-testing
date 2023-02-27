from kubernetes import client, config, utils, dynamic, watch
from kubernetes.client.rest import ApiException
from pprint import pprint
import time
import pathlib
import yaml

primary_kubeconfig="/home/runyu.jin/odf-4.12/failover/cluster5_kubeconfig"
secondary_kubeconfig="/home/runyu.jin/odf-4.12/failover/cluster7_kubeconfig"

def cluster_login(kubeconfig):
    config.load_kube_config(kubeconfig)

def fence_primary_from_secondary():
    config.load_kube_config(secondary_kubeconfig)
    api_client = client.ApiClient()
    crds = client.CustomObjectsApi(api_client)
    group = 'csiaddons.openshift.io'
    version = 'v1alpha1' # str | the custom resource's version
    plural = 'networkfences' # str | the custom resource's plural name. For TPRs this would be lowercase plural kind.
    name = 'network-fence-cluster5' # str | the custom object's name
    body = [{"op" : "replace", "path" : "/spec/fenceState", "value" : "Fenced"}]
    try:
        crds.api_client.set_default_header('Content-Type', 'application/json-patch+json')
        api_response = crds.patch_cluster_custom_object(group=group, version=version, plural=plural, name=name, body=body)
        pprint(api_response)
    except ApiException as e:
        print("Exception when calling CustomObjectsApi->patch_cluster_custom_object: %s\n" % e)
        exit()

def unfence_primary_from_secondary():
    config.load_kube_config(secondary_kubeconfig)
    api_client = client.ApiClient()
    crds = client.CustomObjectsApi(api_client)
    group = 'csiaddons.openshift.io'
    version = 'v1alpha1' # str | the custom resource's version
    plural = 'networkfences' # str | the custom resource's plural name. For TPRs this would be lowercase plural kind.
    name = 'network-fence-cluster5' # str | the custom object's name
    body = [{"op" : "replace", "path" : "/spec/fenceState", "value" : "Unfenced"}]
    try:
        crds.api_client.set_default_header('Content-Type', 'application/json-patch+json')
        api_response = crds.patch_cluster_custom_object(group=group, version=version, plural=plural, name=name, body=body)
        pprint(api_response)
    except ApiException as e:
        print("Exception when calling CustomObjectsApi->patch_cluster_custom_object: %s\n" % e)
        exit()
        
def verify_fence(fenceState):
    config.load_kube_config(secondary_kubeconfig)
    api_client = client.ApiClient()
    crds = client.CustomObjectsApi(api_client)
    group = 'csiaddons.openshift.io'
    version = 'v1alpha1' # str | the custom resource's version
    plural = 'networkfences' # str | the custom resource's plural name. For TPRs this would be lowercase plural kind.
    name = 'network-fence-cluster5' # str | the custom object's name
    try:
        api_response = crds.get_cluster_custom_object(group, version, plural, name)
        if api_response['spec']['fenceState'] == fenceState:
            while api_response['status']['result'] != "Succeeded":
                print("wait on fencestate to become succeeded...")
                time.sleep(2)
            print("fence state is verified")
        else:
            print("fence state is not " + fenceState)
            exit()
    except ApiException as e:
        print("Exception when calling CustomObjectsApi->get_cluster_custom_object: %s\n" % e)
        exit()

def apply_simple_item(dynamic_client: dynamic.DynamicClient, manifest: dict, verbose: bool=False):
    api_version = manifest.get("apiVersion")
    kind = manifest.get("kind")
    resource_name = manifest.get("metadata").get("name")
    namespace = manifest.get("metadata").get("namespace")
    crd_api = dynamic_client.resources.get(api_version=api_version, kind=kind)

    try:
        crd_api.get(namespace=namespace, name=resource_name)
        crd_api.patch(body=manifest, content_type="application/merge-patch+json")
        if verbose:
            print(f"{namespace}/{resource_name} patched")
    except dynamic.exceptions.NotFoundError:
        crd_api.create(body=manifest, namespace=namespace)
        if verbose:
            print(f"{namespace}/{resource_name} created")

def apply_simple_item_from_yaml(dynamic_client: dynamic.DynamicClient, filepath: pathlib.Path, verbose: bool=False):
    with open(filepath, 'r') as f:
        manifest = yaml.safe_load(f)
        apply_simple_item(dynamic_client=dynamic_client, manifest=manifest, verbose=verbose)

def create_vrg_secondary(vrg_path, vrg_name, vrg_namespace):
    config.load_kube_config(secondary_kubeconfig)
    api_client = client.ApiClient()
    DYNAMIC_CLIENT = dynamic.DynamicClient(
        api_client
    )
    apply_simple_item_from_yaml(DYNAMIC_CLIENT, "vrg.yaml", verbose=True)
    crds = client.CustomObjectsApi(api_client)
    group = 'ramendr.openshift.io' 
    version = 'v1alpha1' # str | the custom resource's version
    plural = 'volumereplicationgroups' # str | the custom resource's plural name. For TPRs this would be lowercase plural kind.
    namespace = vrg_namespace
    name = vrg_name # str | the custom object's name
    try:
        api_response = crds.get_namespaced_custom_object(group, version, namespace, plural, name)
        pprint(api_response)
    except ApiException as e:
        print("vrg creation failed")
        print("Exception when calling CustomObjectsApi->get_cluster_custom_object: %s\n" % e)
        exit()

def check_secondary_vrg_status_ready(vrg_name, vrg_namespace):
    config.load_kube_config(secondary_kubeconfig)
    api_client = client.ApiClient()
    crds = client.CustomObjectsApi(api_client)
    group = 'ramendr.openshift.io' 
    version = 'v1alpha1' # str | the custom resource's version
    plural = 'volumereplicationgroups' # str | the custom resource's plural name. For TPRs this would be lowercase plural kind.
    w = watch.Watch()
    for event in w.stream(func=crds.get_namespaced_custom_object,
                          group=group,
                          version=version,
                          namespace=vrg_namespace,
                          plural=plural,
                          name=vrg_name):
        log.info(event)
        if event["type"] == "ClusterDataReady" and event["object"].status == "True":
            logger.debug("%s deleted before it started", full_name)
            w.stop()
            return

def main():
    check_secondary_vrg_status_ready("busybox", "sample-app")

if __name__ == "__main__":
    main()


