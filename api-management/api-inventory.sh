#!/bin/bash

tab=($(apic apis:list-all -s $server -o $org -c $1 --scope catalog | awk -F ' ' '{print $1}'))
#prepare the header of the response
echo API-name#version#status > temp.txt
#loop on found exposed virtual service tab
for i in "${tab[@]}"
do
    name=$(echo $i | awk -F ':' '{print $1}')
    version=$(echo $i | awk -F ':' '{print $2}')
    state=$(apic apis:list -s $server -o $org -c $1 --scope catalog $name | grep $name:$version | awk -F ' ' '{print $2 $3}')
    echo $name#$version#$state >> temp.txt
done    

# show the result
cat temp.txt  | column -t -c 20000 -s#
rm temp.txt