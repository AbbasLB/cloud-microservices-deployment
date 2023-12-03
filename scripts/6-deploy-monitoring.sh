cd "$(dirname "$(realpath "$0")")"/..


#DEPLOYMENT_TYPE="autopilot-deployment"
DEPLOYMENT_TYPE="standard-deployment"
#DEPLOYMENT_TYPE="standard-kube-prometheus-deployment"


./monitoring-deployment/"$DEPLOYMENT_TYPE"/deploy.sh
