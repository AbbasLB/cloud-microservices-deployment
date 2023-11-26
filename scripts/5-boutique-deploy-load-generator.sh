cd "$(dirname "$(realpath "$0")")"/../load-generator-deployment
terraform init


# Run the script and capture the output
frontend_addr=$(bash 4-boutique-get-ip-address.sh | tail -n 1)

# Apply the value to Terraform using the -var flag
terraform apply -var="frontend_addr=${frontend_addr}"

