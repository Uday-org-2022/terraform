#!/bin/bash 

# Update system and install Apache
sudo yum update -y
sudo yum install -y httpd

# Create a simple web page
sudo echo "<h1>Deployed by EC2 User Data</h1>" > /var/www/html/index.html

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd
