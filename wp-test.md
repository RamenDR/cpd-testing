deploy wordpress using [deploy.sh](deploy.sh)
create vrg in ns to protect; sync mode, enable KubeObject protection (empty to protect all, without any ordering), empty PVC label selector (to protect all PVCs)
Wait for the VRG to back up the namespace to S3 store: watch ClusterDataProtected condition to become true:
kubectl -n sample-app wait vrg/wp --for condition=clusterdataprotected --timeout 2m
Ensure PVs are retained by Ramen
set vrg to secondary (check the timestamp of busybox.)
undeploy wordpress using [undeploy.sh](undeploy.sh), namespace (including vrg) and wait for namespaces to be deleted
create namespace and a vrg as primary 
Wait for the VRG ClusterDataReady condition to become true
kubectl -n sample-app wait vrg/wp --for condition=clusterdataready --timeout 0m
delete pod wordpress-75cc8c8dc7-nq4jp and wait for recreation
At this point, the namespace should be restored. 
