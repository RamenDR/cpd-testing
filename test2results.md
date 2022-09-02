pod:
audit-trail-service-78ff684448-zd86r
gov-app-config-service-d467c96c9-cv684
gov-user-prefs-service-858ddddcd-z6rc2
ia-analysis-8f54b7d69-fvh95
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
ibm-nginx-554bf9d9b8-gtzjq
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
