source env.sh
/nfs/OCP-installer/oclogincluster $primary
../cpdbr-oadp uninstall --cpd-namespace=cpd-instance --component=cpdbr-hooks --log-level=debug --verbose
read -p "Press enter to continue"
../cpdbr-oadp install --cpd-namespace=cpd-instance --component=cpdbr-hooks --cpdbr-hooks-image-prefix=quay.io/cpdsre --log-level=debug --verbose
read -p "Press enter to continue"
kubectl create -f ../cpd-instance-recipe.yaml
read -p "Press enter to continue"
kubectl apply -f ../cpd-instance-vrg.yaml 
../wait_for_dr_ready.sh
