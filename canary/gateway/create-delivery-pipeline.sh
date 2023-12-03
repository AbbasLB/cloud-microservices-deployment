cd "$(dirname "$(realpath "$0")")"/manifests

if [ $# -ne 1 ]; then
    echo "Usage: $0 <PROJECT_ID>"
    exit 1
fi

GOOGLE_CLOUD_PROJECT_ID=$1

sed -i "s/GOOGLE_CLOUD_PROJECT_ID/$GOOGLE_CLOUD_PROJECT_ID/g" canary-cloud-deploy.yaml

# Deploy with the provided project ID
gcloud deploy apply --file=canary-cloud-deploy.yaml --region=europe-west6 --project="$GOOGLE_CLOUD_PROJECT_ID"
