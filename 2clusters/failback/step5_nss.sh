#!/bin/bash
source env.sh
/nfs/OCP-installer/oclogincluster $primary
oc patch nss nss-cpd-operators -n cpd-operators -p '{"spec":{"namespaceMembers":["cpd-instance","cpd-operators"]}}' --type=merge
