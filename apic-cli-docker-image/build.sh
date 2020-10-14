#!/bin/bash

REPO=jtarte/apic-cli
VERSION=1.0


if [ -n "$1" ] 
then
    REPO=$1
    if [ -n "$2" ]
    then
        VERSION=$(echo $2)
    fi
fi

echo $REPO:$VERSION

docker build -t $REPO:$VERSION .
docker tag $REPO:$VERSION $REPO:latest

