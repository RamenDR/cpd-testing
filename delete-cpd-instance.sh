ns=cpd-instance
oc delete client -n $ns --all
# Get CCS CR, delete finalizers and delete CR
ccs=$(oc get ccs -n $ns | awk '{print $1}')
for i in $ccs
do
    oc patch ccs $i -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete ccs $i -n $ns
done


# Get DataStage CR, delete finalizers and delete CR
PXRuntime=$(oc get PXRuntime -n $ns | awk '{print $1}')
for i in $PXRuntime
do
    oc patch PXRuntime $i -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete PXRuntime $i -n $ns 
done


# Get IIS CR, delete finalizers and delete CR
iis=$(oc get iis -n $ns | awk '{print $1}')
for i in $iis
do
    oc patch iis $i -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete iis $i -n $ns 
done


# Get wKC CR, delete finalizers and delete CR
wkc=$(oc get wkc -n $ns | awk '{print $1}')
for i in $wkc
do
    oc patch wkc $i -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete wkc $i -n $ns
done


# Get UG CR, delete finalizers and delete CR
ug=$(oc get ug -n $ns | awk '{print $1}')
for i in $ug
do
    oc patch ug $i -n $ns  -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete ug $i -n $ns
done


# Get Db2assservice CR, delete finalizers and delete CR
db2=$(oc get Db2aaserviceService -n wkc | awk '{print $1}')
for i in $db2
do
    oc patch Db2aaserviceService $i -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete Db2aaserviceService $i -n $ns
done


or=$(oc get operandrequest -n $ns | awk '{print $1}')
for i in $or
do
    oc patch operandrequest $i -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
    oc delete operandrequests $i -n $ns
done

zen=$(oc get zenservice -n $ns | awk '{print $1}')
for i in $zen
do
    oc delete zenservice $i -n $ns
done

oc patch rolebinding admin -n $ns -p '{"metadata":{"finalizers":[]}}' --type=merge
#oc edit namespacescope cpd-operators -n $ns
# Remove $ns Namespace from namespaceMembers field
# Retrieve existing namespaceMembers field
#oc get namespacescope cpd-operators -n <cpd_operators_project_name> -o jsonpath={.spec.namespaceMembers}
# Remove $ns Namespace from namespaceMembers field
#oc patch namespacescope cpd-operators -n <cpd_operators_project_name> -p $'{"spec":{"namespaceMembers":["<remaining-namespaces"]}}' --type=merge
oc delete project $ns
oc get project $ns -o jsonpath="{.status}"
kubectl delete ns $ns
