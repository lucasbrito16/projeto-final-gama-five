#!/bin/bash
cd 02-pipeline-jenkins-deploy-ami-db-mysql/00-terraform
uri=$(terraform output | grep public_ip | awk '{print $2;exit}' | sed -e "s/\",//g")

echo $uri

ssh -i /var/lib/jenkins/.ssh/kp-gamafive.pem ubuntu@$uri -oStrictHostKeyChecking=no << EOF
echo \$(pwd)
version=\$(mysql -V)
echo "\$version"
if [[ ! -z "\$version" ]];
then 
    echo "::::: MySQL instalado :::::"
    exit 0
else
    echo "::::: MySQL não instalado :::::"
    exit 1
fi
EOF