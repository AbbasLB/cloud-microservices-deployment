#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io

# Install git and clone the repo
sudo apt install git

# Clone the repo
git clone https://github.com/GoogleCloudPlatform/microservices-demo.git

# Build the image
cd ./microservices-demo/src/loadgenerator/
sudo docker build -t load-generator-image -f Dockerfile .

# Run the container with specified arguments
sudo docker run -P -d -e FRONTEND_ADDR="${FRONTEND_ADDR}" -e USERS="${USERS}" -e LOCUST_CSV=results load-generator-image

sleep 600  #sleep 6 minutes
DOCKER_ID=$(sudo docker ps -lq)
sudo docker cp $DOCKER_ID:/loadgen/results_stats.csv /var/log/
sudo docker cp $DOCKER_ID:/loadgen/results_stats_history.csv /var/log
sudo docker cp $DOCKER_ID:/loadgen/results_failures.csv /var/log

cd /var/log
sudo chmod 777 *.csv
#sudo docker logs --follow $(sudo docker ps -lq)
#sudo docker logs --follow $(sudo docker ps -lq)
