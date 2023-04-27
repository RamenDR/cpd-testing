#!/bin/bash
oc project cpd-instance
for i in `oc api-resources | grep cpd.ibm.com |  awk '{print $1}'`
do
    echo "oc get $i"
    oc get $i --ignore-not-found
    cr=`oc get $i --ignore-not-found --no-headers | awk '{print $1}'`
    if [ "x$cr" != "x" ]
    then
        oc get $i $cr -o yaml | grep Status
    fi
    echo "------"
done
