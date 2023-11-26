cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform
terraform init
terraform apply
