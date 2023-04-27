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

vrg=$(oc get vrg -n cpd-instance | awk '{print $1}' | sed -n '2p')
kubectl patch vrg/$vrg --type=merge -p '{"spec":{"replicationState":"primary"}}' -n cpd-instance
sleep 120
kubectl delete vrg $vrg -n cpd-instance 
pvc=$(kubectl get pvc -n cpd-instance | awk '{print $1}')
for i in $pvc
do
	timeout 5 oc delete pvc $i -n cpd-instance
        oc patch pvc $i -n cpd-instance -p '{"metadata":{"finalizers":[]}}' --type=merge
done
sleep 120

cpd-cli manage delete-cr \
--cpd_instance_ns=${PROJECT_CPD_INSTANCE} \
--components=${COMPONENTS}

cpd-cli manage get-cr-status \
--cpd_instance_ns=${PROJECT_CPD_INSTANCE}

oc delete project ${PROJECT_CPD_INSTANCE} &
sleep 300
oc api-resources --verbs=list --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n ${PROJECT_CPD_INSTANCE} -o name 2>/dev/null | grep -v packagemanifest | xargs oc patch -p '{"metadata":{"finalizers":[]}}' --type=merge -n ${PROJECT_CPD_INSTANCE}
kubectl delete ns ${PROJECT_CPD_INSTANCE}
./create-cpd-instance.sh
