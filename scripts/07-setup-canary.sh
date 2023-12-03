
cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform
gcp_project_id=$(grep 'gcp_project_id' terraform.tfvars | sed 's/.*= *//; s/"//g')

cd ../../canary/gateway

./setup-gateway-and-istio.sh
./create-delivery-pipeline.sh $gcp_project_id
