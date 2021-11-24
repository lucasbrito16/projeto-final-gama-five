#!/bin/bash

cd 02-pipeline-jenkins-deploy-ami-db-mysql/00-terraform
terraform init
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
sleep 10 # 10 segundos