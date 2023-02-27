if [ $# -ne 1 ]; then
	echo "please specify input 1: primary/secondary"
	exit 1
fi
if [ $1 = "primary" ]; then
    source cpd_vars.sh
    /nfs/OCP-installer/oclogincluster $primary
else
    source cpd_vars_secondary.sh
    /nfs/OCP-installer/oclogincluster $secondary
fi
cpd-cli manage login-to-ocp \
--username=${OCP_USERNAME} \
--password=${OCP_PASSWORD} \
--server=${OCP_URL}

cpd-cli manage delete-cr \
--cpd_instance_ns=${PROJECT_CPD_INSTANCE} \
--components=${COMPONENTS}

cpd-cli manage get-cr-status \
--cpd_instance_ns=${PROJECT_CPD_INSTANCE}

oc delete project ${PROJECT_CPD_INSTANCE}
sleep 300
oc api-resources --verbs=list --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n ${PROJECT_CPD_INSTANCE} -o name 2>/dev/null | grep -v packagemanifest | xargs oc patch -p '{"metadata":{"finalizers":[]}}' --type=merge -n ${PROJECT_CPD_INSTANCE}
oc get project ${PROJECT_CPD_INSTANCE} -o jsonpath="{.status}"
kubectl delete ns ${PROJECT_CPD_INSTANCE}
./create-cpd-instance.sh
