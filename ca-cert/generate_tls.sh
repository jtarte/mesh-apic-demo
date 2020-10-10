#!/bin/bash

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=istio demo ./CN=$1' -keyout $1.key -out $1.crt
