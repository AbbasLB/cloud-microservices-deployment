cd src

sudo docker build -t gcr.io/cloud-computing-lab-1-402606/frontend-latency-test:v1 .
sudo gcloud auth configure-docker
sudo docker push gcr.io/cloud-computing-lab-1-402606/frontend-latency-test:v1
