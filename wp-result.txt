when first creating the pod wordpress-75cc8c8dc7-nq4jp, it has this error: 
```sh
sed: couldn't open temporary file ./sedkEU2u0: Permission denied
```
and the pod is crashing.
pod yaml file: 

```sh
kind: Pod
apiVersion: v1
metadata:
  generateName: wordpress-75cc8c8dc7-
  annotations:
    k8s.v1.cni.cncf.io/network-status: |-
      [{
          "name": "openshift-sdn",
          "interface": "eth0",
          "ips": [
              "172.25.32.135"
          ],
          "default": true,
          "dns": {}
      }]
    k8s.v1.cni.cncf.io/networks-status: |-
      [{
          "name": "openshift-sdn",
          "interface": "eth0",
          "ips": [
              "172.25.32.135"
          ],
          "default": true,
          "dns": {}
      }]
    openshift.io/scc: restricted
  resourceVersion: '43865680'
  name: wordpress-75cc8c8dc7-cgh2h
  uid: 414eb848-952a-4e84-a29a-dd49e1fce9ca
  creationTimestamp: '2022-09-15T21:23:46Z'
  managedFields:
    - manager: kube-controller-manager
      operation: Update
      apiVersion: v1
      time: '2022-09-15T21:23:46Z'
      fieldsType: FieldsV1
      fieldsV1:
        'f:metadata':
          'f:generateName': {}
          'f:labels':
            .: {}
            'f:app': {}
            'f:pod-template-hash': {}
            'f:tier': {}
          'f:ownerReferences':
            .: {}
            'k:{"uid":"633ee2e7-5687-41ed-9fd4-0711155d0b0e"}': {}
        'f:spec':
          'f:containers':
            'k:{"name":"wordpress"}':
              'f:image': {}
              'f:volumeMounts':
                .: {}
                'k:{"mountPath":"/var/www/html"}':
                  .: {}
                  'f:mountPath': {}
                  'f:name': {}
              'f:terminationMessagePolicy': {}
              .: {}
              'f:resources': {}
              'f:env':
                .: {}
                'k:{"name":"WORDPRESS_DB_HOST"}':
                  .: {}
                  'f:name': {}
                  'f:value': {}
                'k:{"name":"WORDPRESS_DB_PASSWORD"}':
                  .: {}
                  'f:name': {}
                  'f:valueFrom':
                    .: {}
                    'f:secretKeyRef': {}
              'f:terminationMessagePath': {}
              'f:imagePullPolicy': {}
              'f:ports':
                .: {}
                'k:{"containerPort":80,"protocol":"TCP"}':
                  .: {}
                  'f:containerPort': {}
                  'f:name': {}
                  'f:protocol': {}
              'f:name': {}
          'f:dnsPolicy': {}
          'f:enableServiceLinks': {}
          'f:restartPolicy': {}
          'f:schedulerName': {}
          'f:securityContext': {}
          'f:terminationGracePeriodSeconds': {}
          'f:volumes':
            .: {}
            'k:{"name":"wordpress-persistent-storage"}':
              .: {}
              'f:name': {}
              'f:persistentVolumeClaim':
                .: {}
                'f:claimName': {}
    - manager: multus
      operation: Update
      apiVersion: v1
      time: '2022-09-15T21:24:02Z'
      fieldsType: FieldsV1
      fieldsV1:
        'f:metadata':
          'f:annotations':
            'f:k8s.v1.cni.cncf.io/network-status': {}
            'f:k8s.v1.cni.cncf.io/networks-status': {}
      subresource: status
    - manager: Go-http-client
      operation: Update
      apiVersion: v1
      time: '2022-09-15T21:24:03Z'
      fieldsType: FieldsV1
      fieldsV1:
        'f:status':
          'f:conditions':
            'k:{"type":"ContainersReady"}':
              .: {}
              'f:lastProbeTime': {}
              'f:lastTransitionTime': {}
              'f:message': {}
              'f:reason': {}
              'f:status': {}
              'f:type': {}
            'k:{"type":"Initialized"}':
              .: {}
              'f:lastProbeTime': {}
              'f:lastTransitionTime': {}
              'f:status': {}
              'f:type': {}
            'k:{"type":"Ready"}':
              .: {}
              'f:lastProbeTime': {}
              'f:lastTransitionTime': {}
              'f:message': {}
              'f:reason': {}
              'f:status': {}
              'f:type': {}
          'f:containerStatuses': {}
          'f:hostIP': {}
          'f:phase': {}
          'f:podIP': {}
          'f:podIPs':
            .: {}
            'k:{"ip":"172.25.32.135"}':
              .: {}
              'f:ip': {}
          'f:startTime': {}
      subresource: status
  namespace: wordsqlapp
  ownerReferences:
    - apiVersion: apps/v1
      kind: ReplicaSet
      name: wordpress-75cc8c8dc7
      uid: 633ee2e7-5687-41ed-9fd4-0711155d0b0e
      controller: true
      blockOwnerDeletion: true
  labels:
    app: wordpress
    pod-template-hash: 75cc8c8dc7
    tier: frontend
spec:
  restartPolicy: Always
  serviceAccountName: default
  imagePullSecrets:
    - name: default-dockercfg-46jgw
  priority: 0
  schedulerName: default-scheduler
  enableServiceLinks: true
  terminationGracePeriodSeconds: 30
  preemptionPolicy: PreemptLowerPriority
  nodeName: cluster8-hvmtx-worker-fw5h6
  securityContext:
    seLinuxOptions:
      level: 's0:c28,c12'
    fsGroup: 1000780000
  containers:
    - resources: {}
      terminationMessagePath: /dev/termination-log
      name: wordpress
      env:
        - name: WORDPRESS_DB_HOST
          value: wordpress-mysql
        - name: WORDPRESS_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-pass
              key: password
      securityContext:
        capabilities:
          drop:
            - KILL
            - MKNOD
            - SETGID
            - SETUID
        runAsUser: 1000780000
      ports:
        - name: wordpress
          containerPort: 80
          protocol: TCP
      imagePullPolicy: IfNotPresent
      volumeMounts:
        - name: wordpress-persistent-storage
          mountPath: /var/www/html
        - name: kube-api-access-chfjr
          readOnly: true
          mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      terminationMessagePolicy: File
      image: 'wordpress:4.8-apache'
  serviceAccount: default
  volumes:
    - name: wordpress-persistent-storage
      persistentVolumeClaim:
        claimName: word-pv-claim
    - name: kube-api-access-chfjr
      projected:
        sources:
          - serviceAccountToken:
              expirationSeconds: 3607
              path: token
          - configMap:
              name: kube-root-ca.crt
              items:
                - key: ca.crt
                  path: ca.crt
          - downwardAPI:
              items:
                - path: namespace
                  fieldRef:
                    apiVersion: v1
                    fieldPath: metadata.namespace
          - configMap:
              name: openshift-service-ca.crt
              items:
                - key: service-ca.crt
                  path: service-ca.crt
        defaultMode: 420
  dnsPolicy: ClusterFirst
  tolerations:
    - key: node.kubernetes.io/not-ready
      operator: Exists
      effect: NoExecute
      tolerationSeconds: 300
    - key: node.kubernetes.io/unreachable
      operator: Exists
      effect: NoExecute
      tolerationSeconds: 300
status:
  phase: Running
  conditions:
    - type: Initialized
      status: 'True'
      lastProbeTime: null
      lastTransitionTime: '2022-09-15T21:23:47Z'
    - type: Ready
      status: 'False'
      lastProbeTime: null
      lastTransitionTime: '2022-09-15T21:23:47Z'
      reason: ContainersNotReady
      message: 'containers with unready status: [wordpress]'
    - type: ContainersReady
      status: 'False'
      lastProbeTime: null
      lastTransitionTime: '2022-09-15T21:23:47Z'
      reason: ContainersNotReady
      message: 'containers with unready status: [wordpress]'
    - type: PodScheduled
      status: 'True'
      lastProbeTime: null
      lastTransitionTime: '2022-09-15T21:23:46Z'
  hostIP: 10.39.29.239
  podIP: 172.25.32.135
  podIPs:
    - ip: 172.25.32.135
  startTime: '2022-09-15T21:23:47Z'
  containerStatuses:
    - restartCount: 5
      started: false
      ready: false
      name: wordpress
      state:
        waiting:
          reason: CrashLoopBackOff
          message: >-
            back-off 2m40s restarting failed container=wordpress
            pod=wordpress-75cc8c8dc7-cgh2h_wordsqlapp(414eb848-952a-4e84-a29a-dd49e1fce9ca)
      imageID: >-
        docker.io/library/wordpress@sha256:6216f64ab88fc51d311e38c7f69ca3f9aaba621492b4f1fa93ddf63093768845
      image: 'docker.io/library/wordpress:4.8-apache'
      lastState:
        terminated:
          exitCode: 4
          reason: Error
          startedAt: '2022-09-15T21:27:02Z'
          finishedAt: '2022-09-15T21:27:02Z'
          containerID: >-
            cri-o://a045be931f3ab5637d16b1a350a9c1d3607398e37d782ec59fcae6960c778a84
      containerID: 'cri-o://a045be931f3ab5637d16b1a350a9c1d3607398e37d782ec59fcae6960c778a84'
  qosClass: BestEffort
```

This is because the openshift.io/scc: restricted is still using restricted, but anyuid is required.

solution:
delete the pod and wait for recreation. After recreation, the pod shows running and showing openshift.io/scc: anyuid. 
This could be because the serviceaccounts were not restored at first and still uses restricted scc first. 
After they are restored as anyuid, the pod needs to be recreated using the anyuid scc to apply the changes.
