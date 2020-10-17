#!/bin/bash
DIRECTORY=mesh-apic-demo
MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')


for i in `seq 1 $1`
do
    curl -H 'version: v2' --cacert $MYPATH/ca-cert/159.8.94.146.nip.io.crt https://cloud-frontend.159.8.94.146.nip.io/invoke 
    sleep 1
    echo ""
done;