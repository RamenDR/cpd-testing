source env.sh
/nfs/OCP-installer/oclogincluster $secondary
networkfence=$(oc get networkfences -n openshift-dr-system -o wide | awk '{print $1}' | sed -n '2p')
oc get networkfences.csiaddons.openshift.io/$networkfence -n openshift-dr-system -o jsonpath='{.spec.fenceState}{"\n"}'
oc get networkfences.csiaddons.openshift.io/$networkfence -n openshift-dr-system -o jsonpath='{.status.result}{"\n"}'
