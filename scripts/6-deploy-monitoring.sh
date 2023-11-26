cd "$(dirname "$(realpath "$0")")"/..

kubectl apply -f monitoring-deployment/setup
kubectl apply -f monitoring-deployment/prometheus
#kubectl apply -f monitoring-deployment/kube-state-metrics
kubectl apply -f monitoring-deployment/node-exporter
kubectl apply -f monitoring-deployment/grafana

kubectl wait --for=condition=ready pods -l app=prometheus-server -n monitoring --timeout=300s
kubectl wait --for=condition=ready pods -l app=grafana -n monitoring --timeout=300s



