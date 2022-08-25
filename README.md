## Cloud Pak for Data (CPD) Disaster Recovery Tests

| Test description | VRG file | Test results | Slack link
| ------------     | -------------| --- | --- 
| Recipes translated to 3 VRGs, `labelSelector`s present | [vrgs-cpd-labels.yaml](vrgs-cpd-labels.yaml)|
| Recipes translated to 3 VRGs, `labelSelector`s absent | [vrgs-cpd.yaml](vrgs-cpd.yaml)| [4 of 8 pods ready](test1results.md) | https://ibm-research.slack.com/archives/G01EC1VVA56/p1661300185045649
| `KubeObjectProtection: {}` | [vrgs-cpd-everything-namespaced.yaml](vrgs-cpd-everything-namespaced.yaml)
| `KubeObjectProtection: includeClusterResources: true` | [vrgs-cpd-everything.yaml](vrgs-cpd-everything.yaml)

## Questions for Andy
1. Which `github.ibm.com` organization and repos are the CPD code stored in?
   1. `github.ibm.com/IBMPrivateCloud`?
   1. How can we get read access to them?
   1. Where are the recipe hook scripts located?
   ```yaml
    - command: '["/cpdbr-scripts/cpdops/files/cpd-operators.sh", "backup", "--backup-iam-data",
        "--operators-namespace", "${PARENT_NAMESPACE}", "--foundation-namespace",
        "${FOUNDATION_NAMESPACE}"]'
      container: main
      name: operators-backup
      timeout: 600
    - command: '["/cpdbr-scripts/cpdops/files/cpd-operators.sh", "restore", "--operators-namespace",
        "${PARENT_NAMESPACE}", "--foundation-namespace", "${FOUNDATION_NAMESPACE}"]'
      container: main
      name: operators-restore
      timeout: 3600
    - command: '["/cpdbr-scripts/cpdbr/checkpoint_create.sh", "--include-namespaces=${GROUP.cpd-instance-resources.namespaces}"]'
      container: main
      name: checkpoint
      timeout: 1800
    - command: '["/cpdbr-scripts/cpdbr/checkpoint_backup_prehooks.sh", "--include-namespaces=${GROUP.cpd-instance-resources.namespaces}"]'
      container: main
      name: pre-backup
      timeout: 600
    - command: '["/cpdbr-scripts/cpdbr/checkpoint_backup_posthooks.sh", "--include-namespaces=${GROUP.cpd-instance-resources.namespaces}"]'
      container: main
      name: post-backup
      timeout: 600
    - command: '["/cpdbr-scripts/cpdbr/checkpoint_restore_preworkloadhooks.sh", "--include-namespaces=${GROUP.cpd-instance-resources.namespaces}"]'
      container: main
      name: pre-workload
      timeout: 600
    - command: '["/cpdbr-scripts/cpdbr/checkpoint_restore_posthooks.sh", "--include-namespaces=${GROUP.cpd-instance-resources.namespaces}"]'
      container: main
      name: post-workload
      timeout: 3600
      ```
1. Have the recipes been tested?
   1. for all 3 namespaces?
      1. ibm-common-services
      1. cpd-operators
      1. cpd-instance
   1. The `ibm-common-services`/`cpd-operators` recipe seems to include `rolebindings`, but not `roles` or `clusterroles`
	
