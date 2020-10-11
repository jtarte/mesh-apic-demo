#!/bin/bash
DIRECTORY=mesh-apic-demo
MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')


for i in `seq 1 $1`
do
    curl --cacert $MYPATH/ca-cert/192.168.64.2.nip.io.crt https://z-backend.192.168.64.2.nip.io/invoke 
    sleep 1
    echo ""
done;