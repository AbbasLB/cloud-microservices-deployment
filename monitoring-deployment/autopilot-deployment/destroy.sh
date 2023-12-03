cd "$(dirname "$(realpath "$0")")"

kubectl delete --ignore-not-found=true -f setup -f prometheus -f node-exporter -f grafana -f kube-state-metrics
