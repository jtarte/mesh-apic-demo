#!/bin/bash

server=api.mycluster-par01-c3c-16x32-bab45e8004bc87ecf7bae04a5ef90ae7-0000.par01.containers.appdomain.cloud
org=org1
catalog=sandbox 
consumerorg=jerome-tarte 
app=test-app 

apic subscriptions:delete -s $server -o $org -c $catalog --consumer-org $consumerorg -a $app $( apic subscriptions:list -s $server -o $org -c $catalog --consumer-org $consumerorg -a $app | awk -F ' ' '{print $1}')

apic products:delete --scope catalog -s $server -o $org -c $catalog cloudfrontendproduct:1.0.0

apic draft-products:delete -s $server -o $org cloudfrontendproduct:1.0.0

apic draft-apis:delete -s $server -o $org cloudfrontend-svc:1.0.0