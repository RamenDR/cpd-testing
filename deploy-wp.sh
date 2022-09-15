#!/bin/sh

oc create -f mysql-secret
oc adm policy add-scc-to-user anyuid -z deployer -n wordsqlapp
oc adm policy add-scc-to-user anyuid -z default -n wordsqlapp 
oc adm policy add-scc-to-user anyuid -z builder -n wordsqlapp

oc create -f mysql-deployment.yaml -n wordsqlapp
oc create -f wordpress-deployment.yaml -n wordsqlapp

