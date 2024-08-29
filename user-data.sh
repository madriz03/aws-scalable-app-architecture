#!/bin/bash

yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
yum install -y aws-cli
echo "Hola Mundo" > /var/www/html/index.html
systemctl restart httpd