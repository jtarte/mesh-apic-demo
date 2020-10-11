#!/bin/bash

NAMESPACE=openshift-operators
DIRECTORY=mesh-apic-demo

MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')
source $MYPATH/scripts/operator.sh

echo "Pipelines operators cleaning"

clean_operator rh-pipelines
echo""

echo "cleaning terminated"


