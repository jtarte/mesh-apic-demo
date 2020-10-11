#!/bin/bash
DIRECTORY=mesh-apic-demo
MYPATH=$(pwd | sed 's/\('$DIRECTORY'\).*/\1/g')


for i in `seq 1 $1`
do
    curl http://cloud-backend.159.8.94.146.nip.io/invoke 
    sleep 1
    echo ""
done;