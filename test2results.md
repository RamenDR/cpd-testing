pod:
audit-trail-service-78ff684448-zd86r,
gov-app-config-service-d467c96c9-cv684,
gov-user-prefs-service-858ddddcd-z6rc2,
ia-analysis-8f54b7d69-fvh95,
shop4info-mappers-service-0
```sh
ERROR:
Unable to obtain connection from database (jdbc:db2://c-db2oltp-iis-db2u:50000/xmeta) for user 'xmeta': [jcc][t4][2043][11550][4.26.14] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-iis-db2u/172.30.155.206 on port 50,000 with message: Connection timed out (Connection timed out). ERRORCODE=-4499, SQLSTATE=08001
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL State : 08001
Error Code : -4499
Message : [jcc][t4][2043][11550][4.26.14] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-iis-db2u/172.30.155.206 on port 50,000 with message: Connection timed out (Connection timed out). ERRORCODE=-4499, SQLSTATE=08001
```
catalog-api-6c67fbb74-bhfm7
```sh
{"appname":"wdp-catalog","level":"ERROR","timestamp":"2022-09-02T16:11:38.991Z","cams_instance_id":"cams-catalog-api-6c67fbb74-bhfm7-c55deceb-1d73-4e82-91ba-00dd65a49a88","auditLog":false,"thread_id":172,"thread":"Default Executor-thread-23","class":"com.ibm.catalog.CatalogContextListener","line":296,"method":"contextInitialized","message":"COMSV1003E: Error initializing Catalog Service 'null'","stack_trace":"java.lang.IllegalThreadStateException\n\tat java.base/java.lang.Thread.start(Unknown Source)\n\tat com.ibm.catalog.v2.controllers.asset.AsynchronousAssetDeleteThreadGroup.start(AsynchronousAssetDeleteThreadGroup.java:28)\n\tat com.ibm.catalog.v2.controllers.asset.DefaultAsynchronousAssetDeleteProcessor.startBackgroundThreads(DefaultAsynchronousAssetDeleteProcessor.java:72)\n\tat com.ibm.catalog.v2.controllers.asset.AssetDeleteManager.start(AssetDeleteManager.java:47)\n\tat com.ibm.catalog.CatalogContextListener.contextInitialized(CatalogContextListener.java:293)\n\tat com.ibm.ws.webcontainer.webapp.We...
```

c-ibm-dmc-1660756001756623-redis-m-0
```sh
23881:C 02 Sep 2022 04:26:03.956 # Configuration loaded
23881:M 02 Sep 2022 04:26:03.957 # Can't open the append-only file: Permission denied
23882:C 02 Sep 2022 04:26:04.987 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
23882:C 02 Sep 2022 04:26:04.987 # Redis version=5.0.14, bits=64, commit=00000000, modified=0, pid=23882, just started
```

dp-transform-6fcd75c994-gzw2m
```sh
16:06:25.671 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection timed out (Connection timed out). ERRORCODE=-4499, SQLSTATE=08001.
{"appname":"dp-transform","loglevel":"SEVERE","timestamp":{"dateTime":{"date":{"year":2022,"month":9,"day":2},"time":{"hour":16,"minute":6,"second":28,"nano":49000000}},"offset":{"totalSeconds":0},"zone":{"id":"GMT"}},"class":"com.ibm.wdp.transform.service.HeartbeatService","method":"getDashDBConnectionStatus","message_details":"[jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001","thread":"Default Executor-thread-57","exception":"\ncom.ibm.db2.jcc.am.DisconnectNonTransientConnectionException: [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001\n\tat com.ibm.db2.jcc.am.kd.a(kd.java:338)\n\tat com.ibm.db2.jcc.am.kd.a(kd.java:435)\n\tat com.ibm.db2.jc...
16:06:28.945 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
16:06:30.161 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
16:06:31.507 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
16:06:32.913 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
16:06:33.937 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
16:06:35.090 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
16:06:36.306 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/LINEAGE:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection refused (Connection refused). ERRORCODE=-4499, SQLSTATE=08001.
```
gov-catalog-search-index-c8f9c765b-fb8kw
```sh
ERROR StatusLogger Log4j2 could not find a logging implementation. Please add log4j-core to the classpath. Using SimpleLogger to log to the console...
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
org.apache.kafka.common.KafkaException: Failed to construct kafka producer
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:439)
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:290)
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:317)
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:302)
at com.ibm.iis.common.microservice.IndexingApplication.listenKafka(IndexingApplication.java:196)
at com.ibm.iis.common.microservice.IndexingApplication.main(IndexingApplication.java:87)
Caused by: org.apache.kafka.common.config.ConfigException: No resolvable bootstrap urls given in bootstrap.servers
at org.apache.kafka.clients.ClientUtils.parseAndValidateAddresses(ClientUtils.java:88)
at org.apache.kafka.clients.ClientUtils.parseAndValidateAddresses(ClientUtils.java:47)
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:413)
... 5 more
```
ibm-dmc-1660756001756623-admin-79d7b79bbb-csl6t
ibm-dmc-1660756001756623-dbapi-5fdc694b5b-f58lv
ibm-dmc-1660756001756623-explain-567678697d-j6m5s
ibm-dmc-1660756001756623-runsql-0
```sh
2022-09-02 16:13:32 : Starting console...
mkdir: cannot create directory '/mnt/pv/unified_console_data/reallogs/admin_3.1.8-185-x86_64_9d7b79bbb-csl6t': Permission denied
touch: cannot touch '/mnt/pv/unified_console_data/reallogs/admin_3.1.8-185-x86_64_9d7b79bbb-csl6t/console.token': No such file or directory
touch: cannot touch '/opt/ibm-datasrvrmgr/logs/messages.log': No such file or directory
touch: cannot touch '/opt/ibm-datasrvrmgr/logs/repoUtil.0': No such file or directory
touch: cannot touch '/opt/ibm-datasrvrmgr/logs/status.log': No such file or directory
touch: cannot touch '/opt/ibm-datasrvrmgr/logs/admin.0': No such file or directory
touch: cannot touch '/opt/ibm-datasrvrmgr/logs/LOAD.0': No such file or directory
importing redis tls cert
keytool import cert for REDIS_SERVER_HOST_1
Warning: use -cacerts option to access cacerts keystore
Certificate was added to keystore
no more redis host, exit loop
Fri Sep 2 16:13:35 UTC 2022 startup begin
Updating the application server bootstrap properties ...
Updating the application server environment properties ...
Updating the applications ...
Does not find settings for icp4d_enterprise.app.exclude.
Fri Sep 2 16:13:36 UTC 2022 start the wlp server
mkdir: cannot create directory '/opt/ibm-datasrvrmgr/logs': File exists
/opt/ibm-datasrvrmgr/wlp/bin/server: line 956: /opt/ibm-datasrvrmgr/logs/console.log: No such file or directory
Starting server dsweb.
[ps, -p, 206]
PID TTY TIME CMD
Exit code for 'ps' command: 1
Server start error: file lock obtained, and server process is not running.
Server dsweb start failed. Check server logs for details.
Start failed. Please try to start manually.
2022-09-02 16:13:38 : Console started failed!
```
ibm-dmc-1660756001756623-nginx-5444855fc7-6phgf
```sh
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: Connection to ::1 failed: Connection refused.
Ncat: Trying next address...
Ncat: Connection refused.
```
ibm-nginx-554bf9d9b8-gtzjq, ibm-nginx-tester-b4656f796-jdl9s
```sh
starting up
cp: cannot remove '/user-home/_global_/config/dsxl_version.txt': Permission denied
Setting up ssl certificate files...
Custom ssl certs not found. Processing default out-of-the-box self-signed certificate files...
```
kafka-0
```sh
[2022-09-02 16:22:41,095] ERROR Unable to resolve address: zookeeper:2181 (org.apache.zookeeper.client.StaticHostProvider)
java.net.UnknownHostException: zookeeper
at java.base/java.net.InetAddress$CachedAddresses.get(Unknown Source)
at java.base/java.net.InetAddress.getAllByName0(Unknown Source)
at java.base/java.net.InetAddress.getAllByName(Unknown Source)
at java.base/java.net.InetAddress.getAllByName(Unknown Source)
at org.apache.zookeeper.client.StaticHostProvider$1.getAllByName(StaticHostProvider.java:88)
at org.apache.zookeeper.client.StaticHostProvider.resolve(StaticHostProvider.java:141)
at org.apache.zookeeper.client.StaticHostProvider.next(StaticHostProvider.java:368)
at org.apache.zookeeper.ClientCnxn$SendThread.run(ClientCnxn.java:1207)
[2022-09-02 16:22:41,096] WARN Session 0x0 for sever zookeeper:2181, Closing socket connection. Attempting reconnect except it is a SessionExpiredException. (org.apache.zookeeper.ClientCnxn)
java.lang.IllegalArgumentException: Unable to canonicalize address zookeeper:2181 because it's not resolvable
at org.apache.zookeeper.SaslServerPrincipal.getServerPrincipal(SaslServerPrincipal.java:78)
at org.apache.zookeeper.SaslServerPrincipal.getServerPrincipal(SaslServerPrincipal.java:41)
at org.apache.zookeeper.ClientCnxn$SendThread.startConnect(ClientCnxn.java:1161)
at org.apache.zookeeper.ClientCnxn$SendThread.run(ClientCnxn.java:1210)
[2022-09-02 16:22:42,197] ERROR Unable to resolve address: zookeeper:2181 (org.apache.zookeeper.client.StaticHostProvider)
java.net.UnknownHostException: zookeeper
at java.base/java.net.InetAddress$CachedAddresses.get(Unknown Source)
at java.base/java.net.InetAddress.getAllByName0(Unknown Source)
at java.base/java.net.InetAddress.getAllByName(Unknown Source)
at java.base/java.net.InetAddress.getAllByName(Unknown Source)
at org.apache.zookeeper.client.StaticHostProvider$1.getAllByName(StaticHostProvider.java:88)
at org.apache.zookeeper.client.StaticHostProvider.resolve(StaticHostProvider.java:141)
at org.apache.zookeeper.client.StaticHostProvider.next(StaticHostProvider.java:368)
at org.apache.zookeeper.ClientCnxn$SendThread.run(ClientCnxn.java:1207)
```
runtime-manager-api-777fb565f5-l84sc
```sh
{"level":"WARN","timestamp":"2022-09-02T16:21:50.450Z","appname":"runtime-manager-api.runtime-common/i18n","caller":"utils/i18n-utils.go:68","method_name":"github.ibm.com/watson-studio-runtimes/runtime-common/utils.InitI18N","message":"i18n directory is not set. Message lookup / localization has been disabled."}
W0902 16:21:50.451052 1 client_config.go:614] Neither --kubeconfig nor --master was specified. Using the inClusterConfig. This might not work.
2022-09-02T16:21:50.900+0000 INIT runtime-manager.INIT Using controller namespace from NAMESPACE envar
2022-09-02T16:21:50.900+0000 INIT runtime-manager.INIT CPD_LOCATION_CONTROL_PLANE envar not set, using controller plane namespace as control plane namespace
2022-09-02T16:21:50.900+0000 INIT runtime-manager.INIT CPD_LOCATION_DATA_PLANE envar not set, using control plane namespace as data plane namespace
2022-09-02T16:21:50.900+0000 INIT runtime-manager.INIT EXTRA_CA_CERTS envar is set, creating custom TLS config with additional certificates
2022-09-02T16:21:50.900+0000 INIT runtime-manager.INIT /certs/ca.crt certificate added to root CAs
{"level":"INFO","timestamp":"2022-09-02T16:21:50.851Z","appname":"runtime-manager-api.runtime-common/certs","caller":"utils/rest-utils.go:56","method_name":"github.ibm.com/watson-studio-runtimes/runtime-common/utils.InitCerts","message":"Attempting to fetch the system cert pool..."}
{"level":"INFO","timestamp":"2022-09-02T16:21:50.852Z","appname":"runtime-manager-api.runtime-common/certs","caller":"utils/rest-utils.go:618","method_name":"github.ibm.com/watson-studio-runtimes/runtime-common/utils.LoadCertsFromBytes","message":"Successfully loaded certs from '/certs/ca.crt'."}
{"level":"INFO","timestamp":"2022-09-02T16:21:50.852Z","appname":"runtime-manager-api","caller":"utils/auth.go:112","method_name":"github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.InitAuth","message":"Getting JWT Public key from: https://internal-nginx-svc.cpd-instance.svc:12443/auth/jwks"}
{"level":"INFO","timestamp":"2022-09-02T16:21:50.852Z","appname":"runtime-manager-api","caller":"utils/auth.go:158","method_name":"github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.refreshJWKSPublicKeys","message":"Trying to refresh JWKS..."}
{"level":"INFO","timestamp":"2022-09-02T16:21:50.852Z","appname":"runtime-manager-api","caller":"utils/auth.go:162","method_name":"github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.refreshJWKSPublicKeys","message":"Refreshing JWKS from https://internal-nginx-svc.cpd-instance.svc:12443/auth/jwks"}
panic: could not refresh IAM Keys: failed to fetch remote JWK: Get "https://internal-nginx-svc.cpd-instance.svc:12443/auth/jwks": dial tcp 172.30.135.77:12443: connect: connection refused
goroutine 1 [running]:
github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.refreshJWKSPublicKeys({0x183ab80, 0xc000a84270}, 0x1)
/home/travis/gopath/src/github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils/auth.go:168 +0x668
github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.InitAuth()
/home/travis/gopath/src/github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils/auth.go:118 +0x229
main.main()
/home/travis/gopath/src/github.ibm.com/watson-studio-runtimes/runtime-manager/main.go:74 +0x29b
```
solr-0
```sh
ERROR: java.util.concurrent.TimeoutException: Could not connect to ZooKeeper zookeeper:2181/solr within 30000 ms
ERROR - 2022-09-02 16:24:46.379; org.apache.solr.util.SolrCLI; Could not complete mkroot operation for reason: => org.apache.solr.common.SolrException: java.util.concurrent.TimeoutException: Could not connect to ZooKeeper zookeeper:2181/solr within 30000 ms
at org.apache.solr.common.cloud.SolrZkClient.<init>(SolrZkClient.java:195)
org.apache.solr.common.SolrException: java.util.concurrent.TimeoutException: Could not connect to ZooKeeper zookeeper:2181/solr within 30000 ms
at org.apache.solr.common.cloud.SolrZkClient.<init>(SolrZkClient.java:195) ~[solr-solrj-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:57]
at org.apache.solr.common.cloud.SolrZkClient.<init>(SolrZkClient.java:119) ~[solr-solrj-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:57]
at org.apache.solr.common.cloud.SolrZkClient.<init>(SolrZkClient.java:114) ~[solr-solrj-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:57]
at org.apache.solr.common.cloud.SolrZkClient.<init>(SolrZkClient.java:101) ~[solr-solrj-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:57]
at org.apache.solr.util.SolrCLI$ZkMkrootTool.runImpl(SolrCLI.java:2540) ~[solr-core-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:55]
at org.apache.solr.util.SolrCLI$ToolBase.runTool(SolrCLI.java:196) ~[solr-core-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:55]
at org.apache.solr.util.SolrCLI.main(SolrCLI.java:310) ~[solr-core-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:55]
Caused by: java.util.concurrent.TimeoutException: Could not connect to ZooKeeper zookeeper:2181/solr within 30000 ms
at org.apache.solr.common.cloud.ConnectionManager.waitForConnected(ConnectionManager.java:251) ~[solr-solrj-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:57]
at org.apache.solr.common.cloud.SolrZkClient.<init>(SolrZkClient.java:186) ~[solr-solrj-8.11.1.jar:8.11.1 0b002b11819df70783e83ef36b42ed1223c14b50 - janhoy - 2021-12-14 13:50:57]
... 6 more
```
dsx-requisite-pre-install-job-d79g7
```sh
+ '[' -f /cc-home/_global_/security/customer-keystores/idp.keystore.jks ']'
======= Cluster has keystore setup. Restoring it... =======
+ echo '======= Cluster has keystore setup. Restoring it... ======='
+ cp -rf /cc-home/_global_/security/customer-keystores/idp.keystore.jks /cc-home-content/_global_/security/customer-keystores/idp.keystore.jks
+ '[' -f /cc-home/_global_/security/customer-truststores/cacerts ']'
======= Cluster has truststore setup. Restoring it... =======
+ echo '======= Cluster has truststore setup. Restoring it... ======='
+ cp -rf /cc-home/_global_/security/customer-truststores/cacerts /cc-home-content/_global_/security/customer-truststores/cacerts
+ unlink /cc-home-content/.scripts/publishing-startup-scripts
+ cp -rpu /cc-home-content/_global_ /cc-home/
cp: preserving times for '/cc-home/_global_/.custom-images/metadata': Operation not permitted
cp: preserving times for '/cc-home/_global_/.custom-images/temp-images': Operation not permitted
cp: preserving times for '/cc-home/_global_/.custom-images': Operation not permitted
cp: preserving times for '/cc-home/_global_/.remote-images/dsx-hi': Operation not permitted
cp: preserving times for '/cc-home/_global_/.remote-images': Operation not permitted
cp: preserving times for '/cc-home/_global_/.scripts': Operation not permitted
cp: preserving times for '/cc-home/_global_/R': Operation not permitted
cp: preserving times for '/cc-home/_global_/config/.idleshutdown': Operation not permitted
cp: preserving times for '/cc-home/_global_/config/.remote-hosts': Operation not permitted
cp: preserving times for '/cc-home/_global_/config/addons': Operation not permitted
cp: preserving times for '/cc-home/_global_/config/conda': Operation not permitted
cp: preserving times for '/cc-home/_global_/config/i18n': Operation not permitted
cp: preserving times for '/cc-home/_global_/config': Operation not permitted
cp: preserving times for '/cc-home/_global_/python-3': Operation not permitted
cp: preserving times for '/cc-home/_global_/python-3.7': Operation not permitted
cp: preserving times for '/cc-home/_global_/python-3.8': Operation not permitted
cp: preserving times for '/cc-home/_global_/python-3.9': Operation not permitted
cp: preserving times for '/cc-home/_global_/security/artifacts': Operation not permitted
cp: preserving times for '/cc-home/_global_/security/customer-keystores/idp.keystore.jks': Operation not permitted
cp: preserving times for '/cc-home/_global_/security/customer-keystores': Operation not permitted
cp: preserving times for '/cc-home/_global_/security/customer-truststores/cacerts': Operation not permitted
cp: preserving times for '/cc-home/_global_/security/customer-truststores': Operation not permitted
cp: preserving times for '/cc-home/_global_/security': Operation not permitted
cp: preserving times for '/cc-home/_global_/wkc_bg': Operation not permitted
cp: preserving times for '/cc-home/_global_': Operation not permitted
```
ibm-dmc-1660756001756623-job-scheduler-5c485fc9c7-qkk8c
```sh
waiting uc services
```
ibm-dmc-1660756001756623-monitor-0
```sh
waiting ibm-dmc-1660756001756623-dbapi
```

ibm-dmc-1660756001756623-registry-manager-6bd8b4d647-b8pqw
```sh
waiting uc services
```

iis-services-6fc6c85b5-v8wvj
```sh
Ncat: Could not resolve hostname "solr": Name or service not known. QUITTING.
```
is-en-conductor-0, omag-8684d687f6-mchhw, odf-fast-analyzer-74978d759c-t4v8t
```sh
Ncat: Connection timed out.
```
runtime-manager-api-777fb565f5-l84sc
```sh
{"level":"WARN","timestamp":"2022-09-02T18:08:35.751Z","appname":"runtime-manager-api.runtime-common/i18n","caller":"utils/i18n-utils.go:68","method_name":"github.ibm.com/watson-studio-runtimes/runtime-common/utils.InitI18N","message":"i18n directory is not set. Message lookup / localization has been disabled."}
W0902 18:08:35.752076 1 client_config.go:614] Neither --kubeconfig nor --master was specified. Using the inClusterConfig. This might not work.
2022-09-02T18:08:35.900+0000 INIT runtime-manager.INIT Using controller namespace from NAMESPACE envar
2022-09-02T18:08:35.900+0000 INIT runtime-manager.INIT CPD_LOCATION_CONTROL_PLANE envar not set, using controller plane namespace as control plane namespace
2022-09-02T18:08:35.900+0000 INIT runtime-manager.INIT CPD_LOCATION_DATA_PLANE envar not set, using control plane namespace as data plane namespace
2022-09-02T18:08:36.900+0000 INIT runtime-manager.INIT EXTRA_CA_CERTS envar is set, creating custom TLS config with additional certificates
2022-09-02T18:08:36.900+0000 INIT runtime-manager.INIT /certs/ca.crt certificate added to root CAs
{"level":"INFO","timestamp":"2022-09-02T18:08:36.150Z","appname":"runtime-manager-api.runtime-common/certs","caller":"utils/rest-utils.go:56","method_name":"github.ibm.com/watson-studio-runtimes/runtime-common/utils.InitCerts","message":"Attempting to fetch the system cert pool..."}
{"level":"INFO","timestamp":"2022-09-02T18:08:36.150Z","appname":"runtime-manager-api.runtime-common/certs","caller":"utils/rest-utils.go:618","method_name":"github.ibm.com/watson-studio-runtimes/runtime-common/utils.LoadCertsFromBytes","message":"Successfully loaded certs from '/certs/ca.crt'."}
{"level":"INFO","timestamp":"2022-09-02T18:08:36.150Z","appname":"runtime-manager-api","caller":"utils/auth.go:112","method_name":"github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.InitAuth","message":"Getting JWT Public key from: https://internal-nginx-svc.cpd-instance.svc:12443/auth/jwks"}
{"level":"INFO","timestamp":"2022-09-02T18:08:36.150Z","appname":"runtime-manager-api","caller":"utils/auth.go:158","method_name":"github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.refreshJWKSPublicKeys","message":"Trying to refresh JWKS..."}
{"level":"INFO","timestamp":"2022-09-02T18:08:36.150Z","appname":"runtime-manager-api","caller":"utils/auth.go:162","method_name":"github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.refreshJWKSPublicKeys","message":"Refreshing JWKS from https://internal-nginx-svc.cpd-instance.svc:12443/auth/jwks"}
panic: could not refresh IAM Keys: failed to fetch remote JWK: Get "https://internal-nginx-svc.cpd-instance.svc:12443/auth/jwks": dial tcp 172.30.135.77:12443: i/o timeout
goroutine 1 [running]:
github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.refreshJWKSPublicKeys({0x183ab80, 0xc00098d1d0}, 0x1)
/home/travis/gopath/src/github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils/auth.go:168 +0x668
github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils.InitAuth()
/home/travis/gopath/src/github.ibm.com/watson-studio-runtimes/runtime-manager/pkg/utils/auth.go:118 +0x229
main.main()
/home/travis/gopath/src/github.ibm.com/watson-studio-runtimes/runtime-manager/main.go:74 +0x29b
```
spark-hb-register-hb-dataplane-5c4595f67-6l7vv
```sh
Traceback (most recent call last):
File "/usr/local/lib/python3.6/site-packages/urllib3/connection.py", line 175, in _new_conn
(self._dns_host, self.port), self.timeout, **extra_kw
File "/usr/local/lib/python3.6/site-packages/urllib3/util/connection.py", line 95, in create_connection
raise err
File "/usr/local/lib/python3.6/site-packages/urllib3/util/connection.py", line 85, in create_connection
sock.connect(sa)
ConnectionRefusedError: [Errno 111] Connection refused
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 710, in urlopen
chunked=chunked,
File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 386, in _make_request
self._validate_conn(conn)
File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 1040, in _validate_conn
conn.connect()
File "/usr/local/lib/python3.6/site-packages/urllib3/connection.py", line 358, in connect
self.sock = conn = self._new_conn()
File "/usr/local/lib/python3.6/site-packages/urllib3/connection.py", line 187, in _new_conn
self, "Failed to establish a new connection: %s" % e
urllib3.exceptions.NewConnectionError: <urllib3.connection.HTTPSConnection object at 0x7f4f5352b208>: Failed to establish a new connection: [Errno 111] Connection refused
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
File "/usr/local/lib/python3.6/site-packages/requests/adapters.py", line 450, in send
timeout=timeout
File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 786, in urlopen
method, url, error=e, _pool=self, _stacktrace=sys.exc_info()[2]
File "/usr/local/lib/python3.6/site-packages/urllib3/util/retry.py", line 592, in increment
raise MaxRetryError(_pool, url, error or ResponseError(cause))
urllib3.exceptions.MaxRetryError: HTTPSConnectionPool(host='internal-nginx-svc', port=12443): Max retries exceeded with url: /v2/spark/ae/dryrun (Caused by NewConnectionError('<urllib3.connection.HTTPSConnection object at 0x7f4f5352b208>: Failed to establish a new connection: [Errno 111] Connection refused',))
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
File "/opt/ibm/entrypoint//create_kernel.py", line 32, in <module>
response = requests.post(url, data = payload, headers=headers, verify=False, timeout=120)
File "/usr/local/lib/python3.6/site-packages/requests/api.py", line 117, in post
return request('post', url, data=data, json=json, **kwargs)
File "/usr/local/lib/python3.6/site-packages/requests/api.py", line 61, in request
return session.request(method=method, url=url, **kwargs)
File "/usr/local/lib/python3.6/site-packages/requests/sessions.py", line 529, in request
resp = self.send(prep, **send_kwargs)
File "/usr/local/lib/python3.6/site-packages/requests/sessions.py", line 645, in send
r = adapter.send(request, **kwargs)
File "/usr/local/lib/python3.6/site-packages/requests/adapters.py", line 519, in send
raise ConnectionError(e, request=request)
requests.exceptions.ConnectionError: HTTPSConnectionPool(host='internal-nginx-svc', port=12443): Max retries exceeded with url: /v2/spark/ae/dryrun (Caused by NewConnectionError('<urllib3.connection.HTTPSConnection object at 0x7f4f5352b208>: Failed to establish a new connection: [Errno 111] Connection refused',))
Failed to create kernel
```
ug-roles-init-mpqlr
```sh
Update admin user with wkc roles and permissions
curl: (7) Failed to connect to zen-core-api-svc port 4444: Connection timed out
Traceback (most recent call last):
File "<string>", line 1, in <module>
File "/usr/local/lib/python3.10/json/__init__.py", line 293, in load
return loads(fp.read(),
File "/usr/local/lib/python3.10/json/__init__.py", line 346, in loads
return _default_decoder.decode(s)
File "/usr/local/lib/python3.10/json/decoder.py", line 337, in decode
obj, end = self.raw_decode(s, idx=_w(s, 0).end())
File "/usr/local/lib/python3.10/json/decoder.py", line 355, in raw_decode
raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)
```
usermgmt-f8749f4f6-jkzsw
```sh
========== Creating file system directories for 999/admin user ==========
========== File system directories for 999/admin in place ==========
========== Begin user-home setup necessary for usermgmt ==========
>> Setting up sessions directory
>> Setting up tokens directory
chmod: changing permissions of '/user-home/_global_/config': Operation not permitted
```
volumes-profstgintrnl-deploy-68dcd9f69b-xfrxn
```sh
time="2022-09-02T18:16:11Z" level=error msg="ProcessPublicKeyFromNginx - Failed receiving response from server" err="Get \"https://ibm-nginx-svc.cpd-instance:443/auth/jwtpublic\": dial tcp 172.30.186.246:443: i/o timeout"
panic: Get "https://ibm-nginx-svc.cpd-instance:443/auth/jwtpublic": dial tcp 172.30.186.246:443: i/o timeout
goroutine 1 [running]:
zen-core-api/source/apis/commonutils.LogErr(0x1, {0x25f8e40, 0xc0003f6480}, {0xc0009c5c18, 0xc0003b88c0, 0x35})
/go/src/zen-core-api/source/apis/commonutils/auth_util.go:284 +0x1da
zen-core-api/source/apis/commonutils.CheckErr(...)
/go/src/zen-core-api/source/apis/commonutils/auth_util.go:291
zen-core-api/source/apis/commonutils.ProcessPublicKeyFromNginx()
/go/src/zen-core-api/source/apis/commonutils/auth_util.go:87 +0x14e
zen-core-api/source/apis/commonutils.ProcessPublicKeyFile()
/go/src/zen-core-api/source/apis/commonutils/auth_util.go:65 +0x54
zen-core-api/source/apis/commonutils.init.0()
/go/src/zen-core-api/source/apis/commonutils/auth_util.go:51 +0x85
```

wdp-connect-connection-df46f7795-6gt8f
```sh
JVMJ9VM039I -Xscmx is ignored if -Xshareclasses is not specified
Launching defaultServer (WebSphere Application Server 22.0.0.5/wlp-1.0.64.cl220520220425-0301) on IBM J9 VM, version 8.0.7.10 - pxa6480sr7fp10-20220505_01(SR7 FP10) Small Footprint (en_US)
[AUDIT ] CWWKE0001I: The server defaultServer has been launched.
[AUDIT ] CWWKE0100I: This product is licensed for development, and limited production use. The full license terms can be viewed here: https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/license/base_ilan/ilan/22.0.0.5/lafiles/en.html
[AUDIT ] CWWKG0093A: Processing configuration drop-ins resource: /opt/ibm/wlp/usr/servers/defaultServer/configDropins/overrides/defaults-server.xml
[AUDIT ] CWWKZ0058I: Monitoring dropins for applications.
[AUDIT ] CWWKS4104A: LTPA keys created in 9.902 seconds. LTPA key file: /opt/ibm/wlp/output/defaultServer/resources/security/ltpa.keys
[AUDIT ] CWWKT0016I: Web application available (default_host): https://wdp-connect-connection-df46f7795-6gt8f:9443/v2/connections/api/docs/
[AUDIT ] CWWKT0016I: Web application available (default_host): https://wdp-connect-connection-df46f7795-6gt8f:9443/v2/connections/api/explorer/
[AUDIT ] CWWKT0016I: Web application available (default_host): https://wdp-connect-connection-df46f7795-6gt8f:9443/ibm/api/explorer/
[AUDIT ] CWWKT0016I: Web application available (default_host): https://wdp-connect-connection-df46f7795-6gt8f:9443/ibm/api/
[AUDIT ] CWWKT0016I: Web application available (default_host): https://wdp-connect-connection-df46f7795-6gt8f:9443/IBMJMXConnectorREST/
[WARNING ] SRVE9967W: The manifest class path jaxb-api.jar can not be found in jar file file:/opt/ibm/wlp/usr/servers/defaultServer/apps/expanded/wdp-connect-connection.war/WEB-INF/lib/jaxb-core-2.3.0.jar or its parent.
[WARNING ] SRVE9967W: The manifest class path jaxb-core.jar can not be found in jar file file:/opt/ibm/wlp/usr/servers/defaultServer/apps/expanded/wdp-connect-connection.war/WEB-INF/lib/jaxb-impl-2.3.0.jar or its parent.
[WARNING ] SRVE9967W: The manifest class path jaxb-api.jar can not be found in jar file file:/opt/ibm/wlp/usr/servers/defaultServer/apps/expanded/wdp-connect-connection.war/WEB-INF/lib/jaxb-core-2.3.0.jar or its parent.
[WARNING ] SRVE9967W: The manifest class path jaxb-core.jar can not be found in jar file file:/opt/ibm/wlp/usr/servers/defaultServer/apps/expanded/wdp-connect-connection.war/WEB-INF/lib/jaxb-impl-2.3.0.jar or its parent.
[AUDIT ] CWWKF0012I: The server installed the following features: [apiDiscovery-1.0, appSecurity-2.0, concurrent-1.0, distributedMap-1.0, jaxrs-2.0, jaxrsClient-2.0, jndi-1.0, json-1.0, monitor-1.0, restConnector-2.0, servlet-3.1, ssl-1.0].
[AUDIT ] CWWKF0011I: The defaultServer server is ready to run a smarter planet. The defaultServer server started in 95.414 seconds.
[AUDIT ] CWWKZ0022W: Application wdp-connect-connection has not started in 30.002 seconds.
[AUDIT ] CWWKT0016I: Web application available (default_host): https://wdp-connect-connection-df46f7795-6gt8f:9443/
[AUDIT ] CWWKZ0001I: Application wdp-connect-connection started in 118.608 seconds.
[WARNING ] {"class_name":"com.ibm.wdp.service.common.filter.HeaderFilter","method_name":"validateHostHeader","class":"com.ibm.wdp.service.common.filter.HeaderFilter","method":"validateHostHeader","appname":"wdp-connect-connection","user":"NONE","thread_ID":"23","trace_ID":"NONE","transaction_ID":"a1ccaa24-41ee-4f5f-aced-3c013256f666","timestamp":"2022-09-02T18:17:42.151Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"WARNING","message":"CDICW9070E: Host header validation is skipped because the allowed host list could not be generated.","component_ID":"wdp-connect-connection","message_details":"CDICW9070E: Host header validation is skipped because the allowed host list could not be generated."}
[ERROR ] {"class_name":"com.ibm.wdp.connect.connections.api.server.impl.AbstractJAXRSApplication","method_name":"isCamsAvailable","class":"com.ibm.wdp.connect.connections.api.server.impl.AbstractJAXRSApplication","method":"isCamsAvailable","appname":"wdp-connect-connection","user":"NONE","thread_ID":"3c","trace_ID":"NONE","transaction_ID":"NONE","timestamp":"2022-09-02T18:17:54.258Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"SEVERE","message":"org.apache.http.conn.HttpHostConnectException: Connect to internal-nginx-svc.cpd-instance.svc:12443 [internal-nginx-svc.cpd-instance.svc\/172.30.135.77] failed: Connection refused (Connection refused)","exception":"java.io.UncheckedIOException: org.apache.http.conn.HttpHostConnectException: Connect to internal-nginx-svc.cpd-instance.svc:12443 [internal-nginx-svc.cpd-instance.svc\/172.30.135.77] failed: Connection refused (Connection refused)\n\tat com.ibm.wdp.service.common.utils.HttpConnectionUtils.executeRequest(HttpConnect...
org.apache.http.conn.HttpHostConnectException: Connect to internal-nginx-svc.cpd-instance.svc:12443 [internal-nginx-svc.cpd-instance.svc/172.30.135.77] failed: Connection refused (Connection refused)
[WARNING ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"checkConnectorVersionInfo","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"checkConnectorVersionInfo","appname":"wdp-connect-connection","user":"NONE","thread_ID":"23","trace_ID":"NONE","transaction_ID":"a1ccaa24-41ee-4f5f-aced-3c013256f666","timestamp":"2022-09-02T18:17:56.454Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"WARNING","message":"Failed to contact connector service. The exception is: java.net.SocketTimeoutException: connect timed out","exception":"com.ibm.wdp.connect.connectors.api.client.ApiException: java.net.SocketTimeoutException: connect timed out\n\tat com.ibm.wdp.connect.connectors.api.client.ApiClient.execute(ApiClient.java:834)\n\tat com.ibm.wdp.connect.connectors.api.client.GeneralApi.getVersionInfoWithHttpInfo(GeneralApi.java:135)\n\tat com.ibm.wdp.connect.connectors.api.client.GeneralApi.getVersionInfo(GeneralApi.java:122)\n\tat com.ibm.wdp...
java.net.SocketTimeoutException: connect timed out
[ERROR ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"check","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"check","appname":"wdp-connect-connection","user":"NONE","thread_ID":"23","trace_ID":"NONE","transaction_ID":"a1ccaa24-41ee-4f5f-aced-3c013256f666","timestamp":"2022-09-02T18:17:56.483Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"SEVERE","message":"class VersionInfo {\n _configuration: class CommonCustomObject {\n {vaulted_jdbc_url=not-supported, vaulted_credentials=not-supported, allow_personal_credentials=true, swagger_version=2.1.19, allow_shared_credentials=true, service_common_utils_version=7.0.57, environment_name=icp4data}\n }\n failureMessage: The connector service cannot be contacted\n serviceName: wdp-connect-connection\n status: fatal\n timestamp: Fri Sep 02 18:17:56 GMT 2022\n version: 5.0.441\n}","component_ID":"wdp-connect-connection","message_details":"class VersionInf...
[WARNING ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"checkConnectorVersionInfo","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"checkConnectorVersionInfo","appname":"wdp-connect-connection","user":"NONE","thread_ID":"32","trace_ID":"NONE","transaction_ID":"0bdfd743-d4f7-4393-af5d-c7ba86e2a625","timestamp":"2022-09-02T18:17:59.505Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"WARNING","message":"Failed to contact connector service. The exception is: java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc\/172.30.135.77:12443","exception":"com.ibm.wdp.connect.connectors.api.client.ApiException: java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc\/172.30.135.77:12443\n\tat com.ibm.wdp.connect.connectors.api.client.ApiClient.execute(ApiClient.java:834)\n\tat com.ibm.wdp.connect.connectors.api.client.GeneralApi.getVersionInfoWithHttpInfo(GeneralApi.java:135)\n\ta...
java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc/172.30.135.77:12443
[ERROR ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"check","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"check","appname":"wdp-connect-connection","user":"NONE","thread_ID":"32","trace_ID":"NONE","transaction_ID":"0bdfd743-d4f7-4393-af5d-c7ba86e2a625","timestamp":"2022-09-02T18:17:59.540Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"SEVERE","message":"class VersionInfo {\n _configuration: class CommonCustomObject {\n {vaulted_jdbc_url=not-supported, vaulted_credentials=not-supported, allow_personal_credentials=true, swagger_version=2.1.19, allow_shared_credentials=true, service_common_utils_version=7.0.57, environment_name=icp4data}\n }\n failureMessage: The connector service cannot be contacted\n serviceName: wdp-connect-connection\n status: fatal\n timestamp: Fri Sep 02 18:17:59 GMT 2022\n version: 5.0.441\n}","component_ID":"wdp-connect-connection","message_details":"class VersionInf...
[WARNING ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"checkConnectorVersionInfo","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"checkConnectorVersionInfo","appname":"wdp-connect-connection","user":"NONE","thread_ID":"31","trace_ID":"NONE","transaction_ID":"2143d8be-47e1-4980-8e30-6cdde41cb757","timestamp":"2022-09-02T18:18:01.618Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"WARNING","message":"Failed to contact connector service. The exception is: java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc\/172.30.135.77:12443","exception":"com.ibm.wdp.connect.connectors.api.client.ApiException: java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc\/172.30.135.77:12443\n\tat com.ibm.wdp.connect.connectors.api.client.ApiClient.execute(ApiClient.java:834)\n\tat com.ibm.wdp.connect.connectors.api.client.GeneralApi.getVersionInfoWithHttpInfo(GeneralApi.java:135)\n\ta...
java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc/172.30.135.77:12443
[ERROR ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"check","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"check","appname":"wdp-connect-connection","user":"NONE","thread_ID":"31","trace_ID":"NONE","transaction_ID":"2143d8be-47e1-4980-8e30-6cdde41cb757","timestamp":"2022-09-02T18:18:01.641Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"SEVERE","message":"class VersionInfo {\n _configuration: class CommonCustomObject {\n {vaulted_jdbc_url=not-supported, vaulted_credentials=not-supported, allow_personal_credentials=true, swagger_version=2.1.19, allow_shared_credentials=true, service_common_utils_version=7.0.57, environment_name=icp4data}\n }\n failureMessage: The connector service cannot be contacted\n serviceName: wdp-connect-connection\n status: fatal\n timestamp: Fri Sep 02 18:18:01 GMT 2022\n version: 5.0.441\n}","component_ID":"wdp-connect-connection","message_details":"class VersionInf...
[WARNING ] {"class_name":"com.ibm.wdp.connect.connections.HealthChecker","method_name":"checkConnectorVersionInfo","class":"com.ibm.wdp.connect.connections.HealthChecker","method":"checkConnectorVersionInfo","appname":"wdp-connect-connection","user":"NONE","thread_ID":"2f","trace_ID":"NONE","transaction_ID":"450bdf72-6ef2-432d-be36-75a2e86c8dbc","timestamp":"2022-09-02T18:18:14.773Z","tenant":"NONE","session_ID":"NONE","perf":"false","auditLog":"false","loglevel":"WARNING","message":"Failed to contact connector service. The exception is: java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc\/172.30.135.77:12443","exception":"com.ibm.wdp.connect.connectors.api.client.ApiException: java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc\/172.30.135.77:12443\n\tat com.ibm.wdp.connect.connectors.api.client.ApiClient.execute(ApiClient.java:834)\n\tat com.ibm.wdp.connect.connectors.api.client.GeneralApi.getVersionInfoWithHttpInfo(GeneralApi.java:135)\n\ta...
java.net.ConnectException: Failed to connect to internal-nginx-svc.cpd-instance.svc/172.30.135.77:12443
```
wdp-policy-service-d7458bf45-2sl56
```sh
18:22:43.247 [pool-1-thread-1] ERROR com.ibm.ilg.api.store.EntityStoreException - FNRRR1001E EDC00074 : The connection to the following database cannot be established because of the following error: jdbcConnectString: jdbc:db2://c-db2oltp-wkc-db2u:50001/ILGDB:sslConnection=true;user=db2inst1;password=<hidden> Error code = -4499,SQLState = 08001, [jcc][t4][2043][11550][4.21.29] Exception java.net.ConnectException: Error opening socket to server c-db2oltp-wkc-db2u/172.30.9.205 on port 50,001 with message: Connection timed out (Connection timed out). ERRORCODE=-4499, SQLSTATE=08001.
```
