source env.sh
/nfs/OCP-installer/oclogincluster $secondary
cd ../
./delete-cpd-instance.sh secondary
./delete-cpd-operators.sh secondary
cd -
