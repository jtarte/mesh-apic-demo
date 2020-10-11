# !/Bin/bash

DIRECTORY=mesh-apic-demo
MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')


#create the project 
echo "project" $1 "creation"
oc new-project $1

#create teh control plane 
echo "control plane creation"
oc apply -f $MYPATH/service-mesh/servicemeshcontrolplane.yaml -n $1
sleep 5
STATUS=$(oc get smcp basic-install -o template --template '{{.status.annotations.readyComponentCount}}')
LOOP="TRUE"
while [ $LOOP == "TRUE" ]
do
    if [ "$STATUS" == "9/9" ] 
    then
        LOOP="FALSE"
        echo "control plane created"
    else
        echo "waiting for control plane creation"
        STATUS=$(oc get smcp basic-install -o template --template '{{.status.annotations.readyComponentCount}}')
        sleep 5
    fi
done

#create the smmr
echo "service mesh member roll creation"
oc apply -f $MYPATH/service-mesh/servicemeshmemberroll.yaml -n $1
echo "service mesh member roll created"

#configure the outbound traffic
echo "service mesh config update"
oc apply -n istio-system -f ./service-mesh/istio.json
echo "service mesh config updated"