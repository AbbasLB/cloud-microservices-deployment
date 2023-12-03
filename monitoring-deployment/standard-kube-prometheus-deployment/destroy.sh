cd "$(dirname "$(realpath "$0")")"

kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
