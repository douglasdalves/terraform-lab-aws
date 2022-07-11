#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
sudo chkconfig httpd on
echo "Hello from Terraform" > /var/www/html/index.html
sudo amazon-linux-extras install epel -y
sudo yum install stress -y
