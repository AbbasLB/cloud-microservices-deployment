cd "$(dirname "$(realpath "$0")")"/..

kubectl apply -f monitoring-deployment/setup
kubectl apply -f monitoring-deployment/prometheus
#kubectl apply -f monitoring-deployment/kube-state-metrics
kubectl apply -f monitoring-deployment/node-exporter
kubectl apply -f monitoring-deployment/grafana

kubectl wait --for=condition=ready pods --all -n monitoring --timeout=300s


