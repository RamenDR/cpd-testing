Leave `ibm-common-services` and `cpd-operators` namespaces
Recover `cpd-instance` namespace from VRG(s) and hooks

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
  4. create vrg-cpd-instance-resources (vrg/ci) as primary and wait for clusterdataprotected
  5. set vrg-cpd-instance-resources (vrg/ci) as secondary
  6. delete cpd-instance ns following instructions here: https://www.ibm.com/docs/en/cloud-paks/cp-data/4.0?topic=bured-scenario-backing-up-restoring-instance-cloud-pak-data-same-cluster
  7. set vrg back to primary
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
  1. create vrg-cpd-instance-workload-resources (vrg/ci) as primary and wait for clusterdataready
  2. run hook br-service-hooks/post-workload
  3. delete vrg-cpd-instance-workload-resources (vrg/ci)  and create vrg-cpd-instance-operator-resources (vrg/ci) as primary and wait for clusterdataready
  4. check if cpd-instance ns is restored
  ```
