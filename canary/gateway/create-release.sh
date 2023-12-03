cd "$(dirname "$(realpath "$0")")"/manifests

# Check if all required arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <RELEASE_NAME> <PROJECT_ID> <DOCKER_IMAGE_URL>"
    exit 1
fi

RELEASE_NAME=$1
PROJECT_ID=$2
DOCKER_IMAGE_URL=$3

gcloud deploy releases create "$RELEASE_NAME" \
    --project="$PROJECT_ID" \
    --region=europe-west6 \
    --delivery-pipeline=canary-cloud-deployment \
    --images=my-app-image="$DOCKER_IMAGE_URL"
