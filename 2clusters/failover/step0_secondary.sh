source env.sh
/nfs/OCP-installer/oclogincluster $primary
vrg=$(oc get vrg -n cpd-operators | awk '{print $1}' | sed -n '2p')
kubectl patch vrg/$vrg --type=merge -p '{"spec":{"replicationState":"secondary"}}' -n cpd-operators
vrg=$(oc get vrg -n cpd-instance | awk '{print $1}' | sed -n '2p')
kubectl patch vrg/$vrg --type=merge -p '{"spec":{"replicationState":"secondary"}}' -n cpd-instance
sleep 600
