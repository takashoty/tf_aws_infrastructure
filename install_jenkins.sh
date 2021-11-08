#!/bin/bash

set -x

sudo useradd jenkins
sudo usermod -aG docker jenkins

sudo amazon-linux-extras install docker



sudo mkdir /var/jenkins_files
sudo chgrp -R jenkins /var/jenkins_files
sudo chown -R jenkins /var/jenkins_files


sudo docker run -d -it -p 8080:8080 -p 50000:50000 \
-v /var/jenkins_files:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
--restart unless-stopped \
takashoty/jenkins:v3

sudo yum update -y
sleep 10

echo "Done"
exit 0