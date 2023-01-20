#!/bin/bash
sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install -y git wget
cd /home/ec2-user
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
sudo tar xvzf apache-tomcat-9.0.71.tar.gz
sudo mv apache-tomcat-9.0.71 tomcat9
sudo chmod -R 777 tomcat9
cd /home/ec2-user/tomcat9
./bin/startup.sh