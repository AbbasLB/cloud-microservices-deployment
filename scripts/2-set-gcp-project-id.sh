cd "$(dirname "$(realpath "$0")")"/../boutique-deployment/terraform

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_project_id>"
    exit 1
fi

new_project_id="$1"

# Set project id in boutique deployment terraform
file_path_1="terraform.tfvars" 

if [ ! -f "$file_path_1" ]; then
    echo "File not found: $file_path_1"
    exit 1
fi

sed -i "s/^gcp_project_id\s*=.*$/gcp_project_id = \"$new_project_id\"/" "$file_path_1"




cd ../../load-generator-deploymnet

# Set project id in load generator terraform
file_path_2="variables.tf" 

if [ ! -f "$file_path_2" ]; then
    echo "File not found: $file_path_2"
    exit 1
fi

awk -v new_id="$new_project_id" '
{
    if ($0 ~ /^variable "gcp_project_id"/) {
        in_block = 1;
    }
    if (in_block && $0 ~ /default/) {
        sub(/".*"/, "\"" new_id "\"");
        in_block = 0;
    }
    print $0;
}' $file_path_2 > temp_file && mv temp_file $file_path_2


echo "Project id set: $new_project_id"
