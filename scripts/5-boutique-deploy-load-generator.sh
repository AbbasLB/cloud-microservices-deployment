cd "$(dirname "$(realpath "$0")")"/../load-generator-deployment
terraform init
terraform apply
