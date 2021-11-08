1. sudo chmod 777 /lib/systemd/system/docker.service

2. open the docker service file /lib/systemd/system/docker.service. Search for ExecStart and replace that line with the following:

ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock

3. Reload and restart docker service.

sudo systemctl daemon-reload
sudo service docker restart

4. Validate API by executing the following curl commands. Replace <54.221.134.7> with your host IP.

curl http://localhost:4243/version
curl http://54.221.134.7:4243/version