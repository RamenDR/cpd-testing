# Recipe to Velero mapping

## Overview

This document contains a mapping from a source Recipe to several Velero objects,
which implement the Workflow sequence.

## Source Recipe 1: CPD Operators and Foundation Services namespace

```yaml
apiVersion: spp-data-protection.isf.ibm.com/v1alpha1
kind: Recipe
metadata:
  labels:
    icpdsupport/addOnId: cpdbr
    icpdsupport/app: br-service
  name: ibmcpd-operators
  namespace: ibm-common-services
spec:
  appType: cpd-operators
  groups:
  - includedResourceTypes:
    - operatorgroups
    - scheduling
    - configmaps
    - recipe
    - deployment
    - serviceaccount
    - rolebinding
    name: cpd-operators-resources
    type: resource
  - backupRef: cpd-operators-resources
    excludedResourceTypes:
    - configmaps
    - deployment
    - serviceaccount
    - rolebinding
    name: cpd-operators-ns-resources
    type: resource
  - backupRef: cpd-operators-resources
    includedResourceTypes:
    - configmaps
    - deployment
    - serviceaccount
    - rolebinding
    labelSelector: icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
    name: cpd-operators-br-resources
    type: resource
  hooks:
  - labelSelector: icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
    name: br-service-hooks
    namespace: ${PARENT_NAMESPACE}
    ops:
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
    type: exec
  workflows:
  - name: backup
    sequence:
    - hook: br-service-hooks/operators-backup
    - group: cpd-operators-resources
  - name: restore
    sequence:
    - group: cpd-operators-ns-resources
    - group: cpd-operators-br-resources
    - hook: br-service-hooks/operators-restore
```

### Velero Mapping

#### Backup

The Backup section contains a single group, but that group doesn't contain Pods, so
it requires special handling. Create a Backup object to run the hook, then a second
Backup object for the group. Since the Backup object contains Pods, keep it for
use in Restores.

1a) Hook for `operators-backup`

```yaml
apiVersion: velero.io/v1
kind: Backup
metadata:
  name: workflow-backup-pods
spec:
  includedResources:
  - pods
  labelSelector:
    matchLabels:
    -  icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
  hooks: 
    resources:
      name: operators-backup
      pre:
      - exec:
          container: main
          timeout: 600
          command:
          - /cpdbr-scripts/cpdops/files/cpd-operators.sh
          - backup
          - --backup-iam-data
          - --operators-namespace
          - ${PARENT_NAMESPACE}
          - --foundation-namespace
          - ${FOUNDATION_NAMESPACE}
```

1b) Backup for `cpd-operators-resources`

```yaml
apiVersion: velero.io/v1
kind: Backup
metadata:
  name: cpd-operators-resources
spec:
  includedResources:
  - operatorgroups
  - scheduling
  - configmaps
  - recipe
  - deployment
  - serviceaccount
  - rolebinding
```

#### Restore

The Restore sequence involves two groups and a hook. The hook requires a
separate group, as none of the groups contain Pods.

1) group: `cpd-operators-ns-resources`

```yaml
apiVersion: velero.io/v1
kind: Restore
metadata:
  name: cpd-operators-ns-resources
spec:
  backupName: cpd-operators-resources
  excludedResources:
  - configmaps
  - deployment
  - serviceaccount
  - rolebinding
```

2) group: `cpd-operators-br-resources`

```yaml
apiVersion: velero.io/v1
kind: Restore
metadata:
  name: cpd-operators-br-resources
spec:
  backupName: cpd-operators-resources
  labelSelector:
    matchLabels:
    - icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
  includedResources:
  - configmaps
  - deployment
  - serviceaccount
  - rolebinding
```

3) hook: saved Pod backup and Hook

```yaml
apiVersion: velero.io/v1
kind: Restore
metadata:
  name: workflow-restore-hook-1
spec:
  backupName: workflow-backup-pods
  includeResources:
  - pods
  hooks:
    resources:
    - name: operators-restore
      labelSelector:
        matchLabels:
        - icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
      postHooks:
      - exec:
          container: main
          waitTimeout: 3600
          command:
          - /cpdbr-scripts/cpdops/files/cpd-operators.sh
          - restore
          - --operators-namespace
          - ${PARENT_NAMESPACE} 
          - --foundation-namespace
          - {FOUNDATION_NAMESPACE}
```

## Source Recipe 2: CPD instance namespace

```yaml
apiVersion: spp-data-protection.isf.ibm.com/v1alpha1
kind: Recipe
metadata:
  labels:
    icpdsupport/addOnId: cpdbr
    icpdsupport/app: br-service
  name: ibmcpd
  namespace: cpst-zen-demo
spec:
  appType: cpd-instance
  groups:
  - excludedResourceTypes:
    - event
    - event.events.k8s.io
    labelSelector: icpdsupport/ignore-on-nd-backup notin (true)
    name: cpd-instance-resources
    type: resource
  - backupRef: cpd-instance-resources
    excludedResourceTypes:
    - deployments.apps
    - statefulsets.apps
    - daemonsets.apps
    - replicasets.apps
    - controllerrevisions.apps
    - cronjobs.batch
    - jobs.batch
    - pods
    - operandrequests.operator.ibm.com
    - clients
    - imagetags.openshift.io
    name: cpd-instance-pre-workload-resources
    type: resource
  - backupRef: cpd-instance-resources
    includedResourceTypes:
    - deployments.apps
    - statefulsets.apps
    - daemonsets.apps
    - replicasets.apps
    - controllerrevisions.apps
    - cronjobs.batch
    - jobs.batch
    name: cpd-instance-workload-resources
    type: resource
  - backupRef: cpd-instance-resources
    includedResourceTypes:
    - operandrequests.operator.ibm.com
    name: cpd-instance-operator-resources
    type: resource
  hooks:
  - labelSelector: icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
    name: br-service-hooks
    namespace: ${PARENT_NAMESPACE}
    ops:
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
    type: exec
  workflows:
  - name: backup
    sequence:
    - hook: br-service-hooks/checkpoint
    - group: cpd-instance-resources
  - name: restore
    sequence:
    - group: cpd-instance-pre-workload-resources
    - hook: br-service-hooks/pre-workload
    - group: cpd-instance-workload-resources
    - hook: br-service-hooks/post-workload
    - group: cpd-instance-operator-resources
```		

### Velero Mapping

#### Backup

1. velero "backup workflow" object: note that the Backup routine represents the first two items of the sequence

```yaml
apiVersion: velero.io/v1
kind: Backup
metadata: 
  name: workflow-backup
spec: 
  hooks: 
    resources: 
    - name: checkpoint
      labelSelector: 
        matchLabels:
          icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
      pre:
      - exec: 
        container: main 
        timeout: 1800
        command:
        - /cpdbr-scripts/cpdbr/checkpoint_create.sh
        - --include-namespaces=${GROUP.cpd-instance-resources.namespaces}
  labelSelector:
    matchLabels:
    - icpdsupport/ignore-on-nd-backup notin (true)
  excludedResources:  # note: includes Pods, so hooks will run
  - event
  - event.events.k8s.io 
```

#### Restore 

2) velero "restore workflow" is broken into several resources: 
  a) group
  b) pod+exec hook
  c) group
  d) pod+exec hook
  e) group

2a) group

```yaml
apiVersion: velero.io/v1
kind: Restore
metadata:
  name: workflow-restore-1
spec:
  backupName: cpd-instance-resources 
  excludedResources:
  - deployments.apps
  - statefulsets.apps
  - daemonsets.apps
  - replicasets.apps
  - controllerrevisions.apps
  - cronjobs.batch
  - jobs.batch
  - pods
  - operandrequests.operator.ibm.com
  - clients
  - imagetags.openshift.io
```

  
2b) pod+exec hook #1

```yaml
apiVersion: velero.io/v1
kind: Restore
metadata: 
  name: workflow-restore-2
spec: 
  backupName: cpd-instance-resources  # backup contains Pods
  includedResources:
  - pods
  hooks:
    resources:
      postHooks:
        - exec:
            name: pre-workload
            labelSelector:
              matchLabels:
                - icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
            container: main
            waitTimeout: 600
            command: 
            - /cpdbr-scripts/cpdbr/checkpoint_restore_posthooks.sh
            - --include-namespaces=${GROUP.cpd-instance-resources.namespaces}
```

2c) group

```yaml
apiVersion: velero.io/v1 
kind: Restore 
metadata: 
  name: workflow-restore-3
spec: 
  backupName: cpd-instance-workload-resources
  includedResources:
  - deployments.apps
  - statefulsets.apps
  - daemonsets.apps
  - replicasets.apps
  - controllerrevisions.apps
  - cronjobs.batch
  - jobs.batch
```        
        
2d) pod+exec hook #2

```yaml
apiVersion: velero.io/v1
kind: Restore
metadata: 
  name: workflow-restore-4
spec: 
  backupName: cpd-instance-resources  # backup contains Pods
  includedResources:
  - pods
  hooks:
    resources:
      postHooks:
      - exec:
          name: post-workload
          labelSelector:
            matchLabels:
            - icpdsupport/addOnId=cpdbr,icpdsupport/app=br-service
          container: main
          waitTimeout: 3600
          command: 
          - /cpdbr-scripts/cpdbr/checkpoint_restore_posthooks.sh
          - --include-namespaces=${GROUP.cpd-instance-resources.namespaces}
```
          
2e) group

```yaml
apiVersion: velero.io/v1 
kind: Restore 
metadata: 
  name: workflow-restore-5
spec: 
  backupName: cpd-instance-workload-resources
  includedResources:
  - operandrequests.operator.ibm.com
```
