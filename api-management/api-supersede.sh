#!/bin/bash

echo $1
echo $2
echo $3

echo "product_url:" $(apic products:list-all -s $server -o $org -c $1 --scope catalog | grep $2 | awk -F ' ' '{print $4}') > tmp.yaml

cat tmp.yaml

echo "plans:" >> tmp.yaml
echo "- source: default-plan" >> tmp.yaml
echo "  target: default-plan" >> tmp.yaml

apic products:supersede -s $server -o $org -c $1 --scope catalog $3 tmp.yaml
#rm tmp.yaml
