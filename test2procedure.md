Leave `ibm-common-services` and `cpd-operators` namespaces
Recover `cpd-instance` namespace from VRG(s) and hooks

how to use the hooks:
https://ibm.ent.box.com/notes/1001273872485?s=u4u190uwzzhs943t2frtpzkyyc6uo7wy

backup:
  recipe:
  ```sh
   workflows:
    - name: backup
      sequence:
      - hook: br-service-hooks/checkpoint
      - hook: br-service-hooks/pre-backup
      - group: cpd-instance-volumes
      - hook: br-service-hooks/post-backup
      - group: cpd-instance-resources
  ```

  procedure:
  ```sh
  1. run hook br-service-hooks/checkpoint
  2. run hook br-service-hooks/pre-backup
  3. run hook br-service-hooks/post-backup
  4. create [vrg-capture](vrg-capture.yaml) in cpd-instance ns as primary and wait for clusterdataprotected
  5. set [vrg-capture](vrg-capture.yaml) as secondary
  6. delete cpd-instance ns following instructions here: https://www.ibm.com/docs/en/cloud-paks/cp-data/4.0?topic=bured-scenario-backing-up-restoring-instance-cloud-pak-data-same-cluster
  7. set [vrg-capture](vrg-capture.yaml) back to primary
  ```
  
restore:
  recipe:
  ```sh
   - name: restore
    sequence:
    - group: cpd-instance-volumes
    - group: cpd-instance-pre-workload-resources
    - hook: br-service-hooks/pre-workload
    - group: cpd-instance-workload-resources
    - hook: br-service-hooks/post-workload
    - group: cpd-instance-operator-resources
  ```
    
  procedure:
  ```sh
  1. create cpd-instance ns
  1. create [vrg-restore-1](vrg-restore-1.yaml) in cpd-instance ns as primary and wait for clusterdataready
  2. run hook br-service-hooks/post-workload
  3. delete [vrg-restore-1](vrg-restore-1.yaml) and create [vrg-restore-2](vrg-restore-2.yaml) in cpd-instance ns as primary and wait for clusterdataready
  4. check if cpd-instance ns resources are restored: 
  cpd-cli manage get-cr-status --cpd_instance_ns=${PROJECT_CPD_INSTANCE}, 
  check web console of cp4d: 
  cpd-cli manage get-cpd-instance-details --cpd_instance_ns=${PROJECT_CPD_INSTANCE} --get_admin_initial_credentials=true
  ```
