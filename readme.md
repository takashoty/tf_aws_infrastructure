terraform plan -var-file="vars/dev-eu-west-3.tfvars" -out=tfplan

terraform apply -input=false tfplan 

sudo docker run -d -it -p 8080:8080 -p 50000:50000 \
-v /var/jenkins_files:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
--restart unless-stopped \
takashoty/jenkins:v3



sudo docker exec -i <container_id> bash

grab the initial key for first authorization:

sudo docker logs <conatiner_id>

Login with web-gui to jenkins:
<Public IPv4 address of instance>:<port>
Example of Jenkins URL: http://54.237.160.133:8080/

For docker slaves:
'''within' the instance'''
1. sudo chmod 777 /lib/systemd/system/docker.service

2. open the docker service file /lib/systemd/system/docker.service. Search for ExecStart and replace that line with the following:

      sudo nano /lib/systemd/system/docker.service

      ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock

3. Reload and restart docker service.

sudo systemctl daemon-reload
sudo service docker restart

4. check whether docker is there?
curl http://localhost:4243/version

Configure Jenkins:
COnfigure Clouds --> Docker --> tcp://172.31.19.34:4243
Docker Image --> takashoty/jenkins:agent