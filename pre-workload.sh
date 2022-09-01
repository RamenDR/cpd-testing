pod=$(kubectl get pod -n cpd-instance -l component=cpdbr-hooks | awk 'NR==2' | awk {'print $1'})
kubectl exec -it $pod -n cpd-instance -- /cpdbr-scripts/cpdbr/checkpoint_restore_preworkloadhooks.sh --include-namespaces=cpd-instance
