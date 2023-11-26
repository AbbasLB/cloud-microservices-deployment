cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_project_id>"
    exit 1
fi

new_project_id="$1"
file_path="terraform.tfvars" 

if [ ! -f "$file_path" ]; then
    echo "File not found: $file_path"
    exit 1
fi

sed -i "s/^gcp_project_id\s*=.*$/gcp_project_id = \"$new_project_id\"/" "$file_path"

echo "Project id set: $new_project_id"
