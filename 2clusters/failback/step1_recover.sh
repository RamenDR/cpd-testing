#!/bin/bash
source env.sh
/nfs/OCP-installer/oclogincluster $secondary
networkfence=$(oc get networkfences -n openshift-dr-system -o wide | awk '{print $1}' | sed -n '2p')
oc patch networkfences $networkfence -n openshift-dr-system -p '{"spec":{"fenceState":"Unfenced"}}' --type=merge
./verify_fence.sh
./reboot_nodes.sh
