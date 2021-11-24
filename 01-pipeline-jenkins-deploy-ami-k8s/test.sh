#!/bin/bash

uri=$(terraform output | grep public_ip | awk '{print $2;exit}' | sed -e "s/\",//g")

echo $uri

ssh -i /var/lib/jenkins/.ssh/kp-gamafive.pem ubuntu@$uri -oStrictHostKeyChecking=no << EOF

pwd

version=$(kubectl version)

echo $version

if [[ ! -z $version ]]
then 
    echo "::::: Kubernets instalado :::::"
    exit 0
else
    echo "::::: Kubernets não instalado :::::"
    exit 1
fi

EOF