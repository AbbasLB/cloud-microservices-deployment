
cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform
gcp_project_id=$(grep 'gcp_project_id' terraform.tfvars | sed 's/.*= *//; s/"//g')

cd ../../canary/gateway

./create-release.sh "frontend-release-v3" "$gcp_project_id" "gcr.io/cloud-computing-lab-1-402606/frontend:v3"

echo "Visit https://console.cloud.google.com/deploy/delivery-pipelines to advance the rollout"
