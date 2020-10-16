#!/bin/bash
RC=$(curl -k -s -o /dev/null -w "%{http_code}" -H 'x-ibm-client-id: '$2'' --header 'accept: application/json' $1)
if [ $RC -eq 200 ]
then
    exit 0
else
    exit 1
fi