#!/bin/bash

# search exposed virtual service
tab=($(oc get -n $1 vs -l "api_exposed=true" --no-headers| awk -F ' ' '{print $1}'))

# prepare the header of the response
echo API-name#version#swagger#endpoint > temp.txt
#loop on found exposed virtual service tab
for i in "${tab[@]}"
do
    # retreive info
    version=$(oc -n a-cloud-frontend get vs $i -o template --template '{{.metadata.annotations.api_version}}')
    name=$(oc -n a-cloud-frontend get vs $i -o template --template '{{.metadata.annotations.api_name}}')
    swagger=$(oc -n a-cloud-frontend get vs $i -o template --template '{{.metadata.annotations.api_swagger}}')
    protocol=$(oc -n a-cloud-frontend get vs $i -o template --template '{{.metadata.annotations.api_protocol}}')
    host=$( oc -n a-cloud-frontend get vs service-cloud-frondend-a -o json | jq -r '.spec.hosts[0]')
    #prepare response item line
    echo $name#$version#$swagger#$protocol://$host >> temp.txt
done
# show the result
cat temp.txt  | column -t -c 20000 -s#
rm temp.txt