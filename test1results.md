These are the failed pods and the error messages after capturing the cluster scoped resources and drop the labels:

`ns: cpd-operators` `pod: ibm-common-service-operator-ffd5bf648-qqwp6`
```sh
E0824 00:10:50.998047 1 main.go:121] Failed to get common-service-maps: configmaps "common-service-maps" is forbidden: User "system:serviceaccount:cpd-operators:ibm-common-service-operator" cannot get resource "configmaps" in API group "" in the namespace "kube-public"
```
`ns: ibm-common-services` `pod: ibm-common-service-operator-584b9f589f-gctjm`
```sh
E0824 00:11:34.604675 1 main.go:121] Failed to get common-service-maps: configmaps "common-service-maps" is forbidden: User "system:serviceaccount:ibm-common-services:ibm-common-service-operator" cannot get resource "configmaps" in API group "" in the namespace "kube-public"
```
`ns: ibm-common-service` `pod: ibm-common-service-webhook-5c5cfd6844-5wr5d`
```sh
E0824 00:13:32.147248 1 main.go:104] services "ibm-common-service-webhook" is forbidden: User "system:serviceaccount:ibm-common-services:ibm-common-service-webhook" cannot get resource "services" in API group "" in the namespace "ibm-common-services": RBAC: role.rbac.authorization.k8s.io "ibm-common-service-webhook" not foundError setting up webhook server
I0824 00:13:32.147286 1 main.go:107] Starting the Cmd.
E0824 00:13:35.253558 1 main.go:111] no matches for kind "PodPreset" in version "operator.ibm.com/v1alpha1"Manager exited non-zero
```
`ns: ibm-common-services` `pod: secretshare-86d4868f5b-4hftx`
```sh
E0824 00:13:32.364417 1 main.go:93] problem running manager: no matches for kind "SecretShare" in version "ibmcpcs.ibm.com/v1"
```
