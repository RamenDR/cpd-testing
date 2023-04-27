if [ $# -ne 1 ]; then
        echo "please specify input 1: primary or secondary"
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

vrg=$(oc get vrg -n ibm-common-services | awk '{print $1}' | sed -n '2p')
kubectl patch vrg/$vrg --type=merge -p '{"spec":{"replicationState":"primary"}}' -n ibm-common-services 
sleep 120
kubectl delete vrg $vrg -n ibm-common-services

cpd-cli manage delete-olm-artifacts --cpd_operator_ns=${PROJECT_CPD_OPS}

oc delete project ${PROJECT_CPD_OPS} &
sleep 300
oc api-resources --verbs=list --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n ${PROJECT_CPD_OPS} -o name 2>/dev/null | grep -v packagemanifest | xargs oc patch -p '{"metadata":{"finalizers":[]}}' --type=merge -n ${PROJECT_CPD_OPS}
kubectl delete validatingwebhookconfiguration ibm-cs-ns-mapping-webhook-configuration
catsrc=$(kubectl get catsrc -n openshift-marketplace  | grep IBM | awk '{print $1}')
for i in $catsrc
do
	kubectl delete catsrc $i -n openshift-marketplace
done
./create-cpd-operators.sh
