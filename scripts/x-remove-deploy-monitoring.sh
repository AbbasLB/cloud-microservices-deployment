cd "$(dirname "$(realpath "$0")")"/..

kubectl delete --ignore-not-found=true -f monitoring-deployment/setup -f monitoring-deployment/prometheus -f monitoring-deployment/kube-state-metrics -f monitoring-deployment/node-exporter -f monitoring-deployment/grafana
