cd "$(dirname "$(realpath "$0")")"/..

kubectl create namespace monitoring

git clone https://github.com/techiescamp/kubernetes-prometheus
kubectl create -f kubernetes-prometheus/clusterRole.yaml
kubectl create -f kubernetes-prometheus/config-map.yaml
kubectl create -f kubernetes-prometheus/prometheus-deployment.yaml
