#!/bin/bash 
yum update -y 
yum install httpd -y 
cd /var/www/html 
echo "Today, we will be exploring all the routing policies including failover based routing, weighted based routing, latency based routing, geolocation and simple based routing policies" > index.html 
service httpd start 
chkconfig httpd on 
