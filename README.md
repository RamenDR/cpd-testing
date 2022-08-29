## Cloud Pak for Data (CPD) Disaster Recovery Tests

| Clusters | `ibm-common-services` and `cpd-operators` protection | CPD deploy steps | CPD undeploy method | Hook execution |Test description | VRG file | Test results | Slack link |
| ---------| ------------                                         | ---              | ---                 | ---            |---              | -----    | ---          | ---        |
|1|VRGs|1-5|CPD undeploy procedure||VRGs derived from recipes w/ `labelSelector`s present | [vrgs-cpd-labels.yaml](vrgs-cpd-labels.yaml)|
|1|VRGs|1-5|CPD undeploy procedure||VRGs derived from recipes w/ `labelSelector`s absent | [vrgs-cpd.yaml](vrgs-cpd.yaml)| [4 of 8 pods ready](test1results.md) | https://ibm-research.slack.com/archives/G01EC1VVA56/p1661300185045649
|1|VRGs|1|CPD undeploy procedure||`KubeObjectProtection: {}` | [vrgs-cpd-everything-namespaced.yaml](vrgs-cpd-everything-namespaced.yaml)
|1|VRGs|1|CPD undeploy procedure||`KubeObjectProtection: includeClusterResources: true` | [vrgs-cpd-everything.yaml](vrgs-cpd-everything.yaml)| | https://ibm-research.slack.com/archives/G01EC1VVA56/p1661445646846479
|1|none|1-5|[Offline procedure: Delete namespace, remove finalizers](https://www.ibm.com/docs/en/cloud-paks/cp-data/4.5.x?topic=obr-scenario-creating-offline-backup-cloud-pak-data-instance-restoring-it-same-cluster#concept_qpy_zpj_wqb__delete_namespaces)|options:<ul><li>VRG spec 1, hook, VRG spec 2<li>velero hooks<li>SPP method?<li>other, use option 1 in test | [test procedure] test2procedure.md | [vrg-capture.yaml](vrg-capture.yaml) [vrg-restore-1.yaml](vrg-restore-1.yaml) [vrg-restore-2.yaml](vrg-restore-2.yaml) | [test result](test2results.md) | https://ibm-research.slack.com/archives/G01EC1VVA56/p1661795759986199 https://ibm-research.slack.com/archives/G01EC1VVA56/p1661796307489459 https://ibm-research.slack.com/archives/G01EC1VVA56/p1661796526936669
|2|cpd-br tool?|1-5||

## Hook setup and execution
- https://ibm.ent.box.com/notes/1001273872485?s=u4u190uwzzhs943t2frtpzkyyc6uo7wy
   - https://ibm-research.slack.com/archives/C03LJSJ9UES/p1661460825614769
	
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
	
