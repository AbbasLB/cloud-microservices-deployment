cd "$(dirname "$(realpath "$0")")"/downloads

kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v0.6.2/standard-install.yaml

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.17.2 sh - \
&& ./istio-1.17.2/bin/istioctl install --set profile=minimal -y
