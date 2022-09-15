#!/bin/sh
oc delete -f mysql-deployment.yaml -n wordsqlapp
oc delete -f wordpress-deployment.yaml -n wordsqlapp
oc delete -f mysql-secret
oc delete ns wordsqlapp

