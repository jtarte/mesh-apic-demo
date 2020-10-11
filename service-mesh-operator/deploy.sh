# !/Bin/bash

NAMESPACE=openshift-operators
DIRECTORY=mesh-apic-demo

MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')
source $MYPATH/scripts/operator.sh

echo "Deploying RH service mesh"
echo ""

echo "Deploying elasticsearch operator"
deploy_operator $MYPATH/service-mesh-operator/elasticsearch.yaml elasticsearch
echo ""

echo "Deploying jaeger operator"
deploy_operator $MYPATH/service-mesh-operator/jaeger.yaml jaeger
echo ""

echo "Deploying kiali operator"
deploy_operator $MYPATH/service-mesh-operator/kiali.yaml kiali
echo ""

echo "Deploying service mesh operator"
deploy_operator $MYPATH/service-mesh-operator/servicemesh.yaml servicemesh
echo ""

echo "deployment completed"
