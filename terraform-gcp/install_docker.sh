#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io

# Install git and clone the repo
sudo apt install git
git clone https://github.com/GoogleCloudPlatform/microservices-demo.git


# Build the image
cd  ./microservices-demo/src/loadgenerator/
sudo docker build -t load-generator-image -f Dockerfile . 
sudo docker run -P -d -e FRONTEND_ADDR=onlineboutique.dev -e USERS=20 load-generator-image
# sudo docker logs --follow $(sudo docker ps -lq)