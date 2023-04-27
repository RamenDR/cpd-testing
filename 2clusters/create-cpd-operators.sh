#kubectl create ns cpd-operators
#kubectl annotate ns cpd-operators openshift.io/sa.scc.uid-range=1000760000/10000 --overwrite
#kubectl annotate ns cpd-operators openshift.io/sa.scc.supplemental-groups=1000760000/10000 --overwrite
kubectl create ns ibm-common-services
kubectl annotate ns ibm-common-services openshift.io/sa.scc.uid-range=1000750000/10000 --overwrite
kubectl annotate ns ibm-common-services openshift.io/sa.scc.supplemental-groups=1000750000/10000 --overwrite
