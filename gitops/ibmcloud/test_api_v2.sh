#!/bin/bash
DIRECTORY=mesh-apic-demo
MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')


for i in `seq 1 $1`
do
    curl -k -H 'x-ibm-client-id: b349b23c1ccc34e9903bb4d178bd34b8' https://gw.mycluster-par01-c3c-16x32-bab45e8004bc87ecf7bae04a5ef90ae7-0000.par01.containers.appdomain.cloud/org1/sandbox/cloudfrontend-svc/v2/invoke
    sleep 1
    echo ""
done;