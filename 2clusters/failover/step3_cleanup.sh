source env.sh
/nfs/OCP-installer/oclogincluster $primary
cd ../
./delete-cpd-instance.sh primary
./delete-cpd-operators.sh primary
cd -
