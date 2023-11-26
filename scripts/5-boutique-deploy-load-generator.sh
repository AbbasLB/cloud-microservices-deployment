cd "$(dirname "$(realpath "$0")")/../load-generator-deployment"


# Run the script and capture the output
frontend_addr=$(bash ../scripts/4-boutique-get-ip-address.sh | tail -n 1)

# Set default values
default_vm_name="boutique-load-generator"
default_users_count=20

# Parse optional arguments
vm_name="${1:-$default_vm_name}"
users_count="${2:-$default_users_count}"

# Print used settings
echo "Used settings:"
echo "VM Name: $vm_name"
echo "Users Count: $users_count"
echo "Frontend Address: $frontend_addr"

# Initialize Terraform
terraform init

# Apply the values to Terraform using the -var flag
terraform apply -var="frontend_addr=${frontend_addr}" -var="vm_name=${vm_name}" -var="users_count=${users_count}"

