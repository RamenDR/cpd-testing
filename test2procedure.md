Leave `ibm-common-services` and `cpd-operators` namespaces
Recover `cpd-instance` namespace from VRG(s) and hooks

how to use the hooks:
https://ibm.ent.box.com/notes/1001273872485?s=u4u190uwzzhs943t2frtpzkyyc6uo7wy
install spp:
https://www.ibm.com/docs/en/spp/10.1.7?topic=platform-installing-operator-in-online-environment

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
  1. run hook br-service-hooks/checkpoint (checkpoint.sh)
  2. run hook br-service-hooks/pre-backup (pre-backup.sh)
  3. run hook br-service-hooks/post-backup (post-backup.sh)
  4. create [vrg-capture](vrg-capture.yaml) in cpd-instance ns as primary and wait for clusterdataprotected
  5. check minio content: vrg, persistent volume, kubeobjects
  6. set [vrg-capture](vrg-capture.yaml) as secondary
  7. delete cpd-instance ns following instructions here: (delete-cpd-instance.sh)
  https://www.ibm.com/docs/en/cloud-paks/cp-data/4.0?topic=bured-scenario-backing-up-restoring-instance-cloud-pak-data-same-cluster 
  ```
vrg backup:  
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
  2. create [vrg-restore-1](vrg-restore-1.yaml) in cpd-instance ns as primary and wait for clusterdataready
  3. check if pods are coming back in cpd-instance ns
  4. run hook br-service-hooks/post-workload (post-workload.sh)
  5. delete [vrg-restore-1](vrg-restore-1.yaml) and create [vrg-restore-2](vrg-restore-2.yaml) in cpd-instance ns as primary and wait for clusterdataready
  6. check if cpd-instance ns resources are restored: 
  (cpd-cli can be installed here: https://github.com/IBM/cpd-cli)
  cpd-cli manage get-cr-status --cpd_instance_ns=cpd-instance
  7. check web console of cp4d: 
  cpd-cli manage get-cpd-instance-details --cpd_instance_ns=cpd-instance --get_admin_initial_credentials=true
  ```
