cd "$(dirname "$(realpath "$0")")/../load-generator-deployment"

# Check if the instance count is provided as a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <instance_count>"
    exit 1
fi

# Assign provided argument to variable
instance_count="$1"

# Run the script and capture the output
frontend_addr=$(bash ../scripts/4-boutique-get-ip-address.sh | tail -n 1)

# Print the instance count being used
echo "Creating $instance_count instances targeting $frontend_addr ..."

# Initialize Terraform
terraform init

# Apply the value to Terraform using the -var flag for instance_count
terraform apply -var="frontend_addr=${frontend_addr}" -var="instances_count=${instance_count}"
