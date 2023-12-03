cd src/v3

sudo docker build -t gcr.io/cloud-computing-lab-1-402606/frontend:v3 .
sudo gcloud auth configure-docker
sudo docker push gcr.io/cloud-computing-lab-1-402606/frontend:v3
