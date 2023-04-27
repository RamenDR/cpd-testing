kubectl create ns cpd-instance
kubectl annotate ns cpd-instance openshift.io/sa.scc.uid-range=1000780000/10000 --overwrite
kubectl annotate ns cpd-instance openshift.io/sa.scc.supplemental-groups=1000780000/10000 --overwrite
