#!/bin/bash 
yum update -y 
yum install httpd -y 
cd /var/www/html 
echo "JJ Tech Inc Disaster Recovery strategy include using Route53 Failover Based Routing" > index.html 
service httpd start 
chkconfig httpd on 
