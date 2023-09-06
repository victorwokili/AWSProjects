#!/bin/bash
# get admin privileges
sudo su
# install httpd
yum update -y
yum install -y httpd.x86_64 
systemctl start httpd.service
systemctl enable httpd.service
mkdir /var/www/html/payments/
echo "<h1>This is page is to receive all payments</h1>" > /var/www/html/index.html
