#!/bin/bash
source env.sh
/nfs/OCP-installer/oclogincluster $primary
vrg=$(oc get vrg -n ibm-common-services | awk '{print $1}' | sed -n '2p')
kubectl patch vrg/$vrg --type=merge -p '{"spec":{"replicationState":"secondary"}}' -n ibm-common-services
vrg=$(oc get vrg -n cpd-instance | awk '{print $1}' | sed -n '2p')
kubectl patch vrg/$vrg --type=merge -p '{"spec":{"replicationState":"secondary"}}' -n cpd-instance
/nfs/OCP-installer/oclogincluster $secondary
networkfence=$(oc get networkfences -n openshift-dr-system -o wide | awk '{print $1}' | sed -n '2p')
oc patch networkfences $networkfence -n openshift-dr-system -p '{"spec":{"fenceState":"Fenced"}}' --type=merge
sleep 5
./verify_fence.sh
sleep 5
mc tree $primary --insecure
