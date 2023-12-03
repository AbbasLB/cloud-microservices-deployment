cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform

# Extract the project id
gcp_project_id=$(grep 'gcp_project_id' terraform.tfvars | sed 's/.*= *//; s/"//g')

# Extract the default value of zone
zone_default=$(awk '/variable "zone"/, /default/ {if ($1 == "default") {gsub(/"/, "", $3); print $3}}' variables.tf)

# Extract the default value of name
name_default=$(awk '/variable "name"/, /default/ {if ($1 == "default") {gsub(/"/, "", $3); print $3}}' variables.tf)

gcloud container clusters get-credentials $name_default --zone=$zone_default --project=$gcp_project_id

kubectl get service frontend-gateway-istio | awk '{print $4}'