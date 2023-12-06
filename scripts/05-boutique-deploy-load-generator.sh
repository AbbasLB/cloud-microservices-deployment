cd "$(dirname "$(realpath "$0")")/../load-generator-deployment"

# Check if the required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <instance_count> <users_count>"
    exit 1
fi

# Assign provided arguments to variables
instance_count="$1"
users_count="$2"
frontend_addr=$(bash ../scripts/04-boutique-get-frontend-ip-address.sh | tail -n 1)

# Print the instance and user count being used
echo "Creating $instance_count instances targeting $frontend_addr ..."
echo "Setting users count to $users_count..."

# Initialize Terraform
terraform init

# Apply the values to Terraform using the -var flag for instance_count and users_count
terraform apply -var="frontend_addr=${frontend_addr}" -var="instances_count=${instance_count}" -var="users_count=${users_count}"
