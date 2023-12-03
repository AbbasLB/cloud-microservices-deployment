cd "$(dirname "$(realpath "$0")")"

kubectl apply -f setup
kubectl apply -f prometheus
kubectl apply -f kube-state-metrics
kubectl apply -f node-exporter
kubectl apply -f grafana

echo "Waiting for prometheus and grafana pods to be ready ..."

kubectl wait --for=condition=ready pods -l app=prometheus-server -n monitoring --timeout=300s
kubectl wait --for=condition=ready pods -l app=grafana -n monitoring --timeout=300s

