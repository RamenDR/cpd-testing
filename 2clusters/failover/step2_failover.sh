source env.sh
/nfs/OCP-installer/oclogincluster $secondary
../cpdbr-oadp uninstall --foundation-namespace=ibm-common-services --operators-namespace=cpd-operators --component=cpdbr-ops-hooks --log-level=debug --verbose
cpdbr=$(kubectl get clusterrole -A | grep cpdbr | awk '{print $1}')
echo $cpdbr
for i in $cpdbr
do
        kubectl delete clusterrole $i
done
roles=$(kubectl get roles -A | grep cpdbr | awk '{print $2}')
echo $roles
for i in $roles
do
        kubectl delete roles $i -n openshift-marketplace
done
rolebindings=$(kubectl get rolebindings -A | grep cpdbr | awk '{print $2}')
echo $rolebindings
for i in $rolebindings
do
        kubectl delete rolebindings $i -n openshift-marketplace
done
sas=$(kubectl get sa -A | grep cpdbr | awk '{print $2}')
echo $sas
for i in $sas
do
        kubectl delete sa $i -n openshift-marketplace
done
read -p "Press enter to continue"
../cpdbr-oadp install --foundation-namespace=ibm-common-services --operators-namespace=cpd-operators --component=cpdbr-ops-hooks --cpdbr-hooks-image-prefix=quay.io/cpdsre --log-level=debug --verbose
read -p "Press enter to continue"
kubectl create -f ../cpd-operators-recipe.yaml
read -p "Press enter to continue"
kubectl create -f ../cpd-operators-vrg.yaml 
../wait_for_dr_ready.sh
