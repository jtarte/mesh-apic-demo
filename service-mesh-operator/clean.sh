#!/bin/bash

NAMESPACE=openshift-operators
DIRECTORY=mesh-apic-demo

MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')
source $MYPATH/scripts/operator.sh


echo "Service mesh operators cleaning"

clean_operator servicemesh
echo""

clean_operator kiali
echo""

clean_operator jaeger
echo""

clean_operator elasticsearch
echo""

echo "cleaning terminated"


