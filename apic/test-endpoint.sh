#!/bin/bash
# Execute the curl request and get the HTTP response code
RC=$(curl -k -s -o /dev/null -w "%{http_code}" -H 'x-ibm-client-id: '$2'' --header 'accept: application/json' $1)

if [ $RC -eq 200 ]
then
    echo "call API succeded. HTTP code:" $RC
    exit 0
else
    echo "call API failed. HTTP code:" $RC 
    exit 1
fi