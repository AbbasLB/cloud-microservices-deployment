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
sudo docker run -P -d -e FRONTEND_ADDR="${FRONTEND_ADDR}" -e USERS="${USERS}" load-generator-image

#sudo docker logs --follow $(sudo docker ps -lq)