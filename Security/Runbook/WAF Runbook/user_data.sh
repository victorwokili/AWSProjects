#!/bin/bash 
yum update -y 
yum install httpd -y 
cd /var/www/html 
echo "Hello from " > index.html 
service httpd start 
chkconfig httpd on 
