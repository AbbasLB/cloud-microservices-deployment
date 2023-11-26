cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform

# Extract the project id
gcp_project_id=$(grep 'gcp_project_id' terraform.tfvars | sed 's/.*= *//; s/"//g')

# Extract the default value of region
region_default=$(awk '/variable "region"/, /default/ {if ($1 == "default") {gsub(/"/, "", $3); print $3}}' variables.tf)

# Extract the default value of name
name_default=$(awk '/variable "name"/, /default/ {if ($1 == "default") {gsub(/"/, "", $3); print $3}}' variables.tf)

gcloud container clusters get-credentials $name_default --zone=$region_default --project=$gcp_project_id

kubectl get service frontend-external | awk '{print $4}'