#!/bin/bash

openssl req -out $2.$1.csr -newkey rsa:2048 -nodes -keyout $2.$1.key -subj "/CN=$2.$1/O=$2 subdomain od $1 for istio demo"

openssl x509 -req -days 365 -CA ../ca-cert/$1.crt -CAkey ../ca-cert/$1.key -set_serial 0 -in $2.$1.csr -out $2.$1.crt
