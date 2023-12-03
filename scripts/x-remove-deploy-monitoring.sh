cd "$(dirname "$(realpath "$0")")"/..

./monitoring-deployment/autopilot-deployment/destroy.sh
./monitoring-deployment/standard-deployment/destroy.sh
./monitoring-deployment/standard-kube-prometheus-deployment/destroy.sh
