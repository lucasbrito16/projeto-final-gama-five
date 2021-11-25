cd 02-pipeline-jenkins-deploy-ami-db-mysql/00-terraform
uri=$(terraform output | grep public_ip | awk '{print $2;exit}' | sed -e "s/\",//g")

echo $uri

ssh -i /var/lib/jenkins/.ssh/kp-gamafive.pem ubuntu@$uri -oStrictHostKeyChecking=no << EOF
mysql -u root -p'root' -e "create user 'root'@'%' identified with mysql_native_password by 'root'"
mysql -u root -p'root' -e "grant all privileges on *.* to 'root'@'%'"
EOF