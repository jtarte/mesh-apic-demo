# !/Bin/bash

NAMESPACE=openshift-operators

DIRECTORY=mesh-apic-demo

MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')
source $MYPATH/scripts/operator.sh


echo "Deploying RH pipelines"
echo ""

echo "Deploying RH Pipelines operator"
deploy_operator $MYPATH/pipelines-operator/pipelines.yaml rh-pipelines
echo ""

echo "deployment completed"
