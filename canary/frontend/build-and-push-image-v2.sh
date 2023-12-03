cd src/v2

sudo docker build -t gcr.io/cloud-computing-lab-1-402606/frontend:v2 .
sudo gcloud auth configure-docker
sudo docker push gcr.io/cloud-computing-lab-1-402606/frontend:v2
