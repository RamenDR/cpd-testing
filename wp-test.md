1. deploy wordpress using [deploy-wp.sh](deploy-wp.sh)
2. create vrg in ns to protect; sync mode, enable KubeObject protection (empty to protect all, without any ordering), empty PVC label selector (to protect all PVCs)
3. Wait for the VRG to back up the namespace to S3 store: watch ClusterDataProtected condition to become true:
4. kubectl -n sample-app wait vrg/wp --for condition=clusterdataprotected --timeout 2m
5. Ensure PVs are retained by Ramen
6. set vrg to secondary (check the timestamp of busybox.)
7. undeploy wordpress using [undeploy-wp.sh](undeploy-wp.sh), namespace (including vrg) and wait for namespaces to be deleted
8. create namespace and a vrg as primary 
9. Wait for the VRG ClusterDataReady condition to become true
10. kubectl -n sample-app wait vrg/wp --for condition=clusterdataready --timeout 0m
11. delete pod wordpress-75cc8c8dc7-nq4jp and wait for recreation
12. At this point, the namespace should be restored. 
