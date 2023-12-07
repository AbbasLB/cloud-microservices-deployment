 ##### Note: The following project has been implemented and deployed using Google Cloud shell.
We did not deploy anything locally. As far as we know, the system requires the following to be installed:
- git
- Terrafrom
- Authenticated Google cloud cli (gcloud) -> ```gcloud auth application-default login```
- Kubectl
- kustomize
- google-cloud-cli-gke-gcloud-auth-plugin

However, there might be other libraries that we have missed out on/did not include, so we encourage you to run it through the cloud shell

---
# Scripts
```scripts``` directory contains the following bash scripts:

```./01-enable-gcp-required-services.sh```
- Enables the required gcp services to run the scripts

```./02-set-gcp-project-id.sh <new_project_id>```
- Sets gcp project id to be used in the next scripts
- Should be set before calling any of the following scripts


```./03-deploy-boutique-cluster.sh```
- Provisions the GKE cluster and deploys the boutique based on the terraform configs.

```./04-boutique-get-frontend-ip-address.sh```
- Gets the ip address of the frontend-external service

```./05-boutique-deploy-load-generator.sh <instance_count> <users_count>```
- Takes the instances count and user counts as args and deploys VMs targeting the frontend-external.
- Note: This won't call the istio gateway if configured

```./06-deploy-monitoring.sh```
- This deploy the monitoring infrastructure to our cluster

```./07-setup-canary.sh```
- Installs the Kubernetes Gateway API CRDs if not already present on the cluster.
- Enables Istio's Gateway controller implementation by installing Istio.
- Creates Google Cloud Delivery Pipeline 

```./08-release-canary-frontend-v2.sh```
- Creates a canary release to deploy frontend v2
- After the release is created, a link appears to advance the rollout

```./09-release-canary-frontend-v3.sh```
- Creates a canary release to deploy frontend v3
- After the release is created, a link appears to advance the rollout

```./10-boutique-get-istio-gateway-ip-address.sh```
- Gets the ip address of Istio frontend gateway service

```./10-x-remove-deploy-monitoring.sh```
- Removes the deployed monitoring infrastructure from the cluster

---
# boutique-deployment
```boutique-deployment``` directory contains all manifest files and terrafrom configs to deploy the boutique
### kustomize
```kustomize``` directory cotnains the Kustomize components that will be used to generate the deployment manifest
### terraform
```terraform``` directory contains the terraform configs to provision the GKE cluster and apply the kustomize manifest files

---

# load-generator-deployment
```load-generator-deployment``` directory contains the terraform configs to provision VMs and to deploy the load generator on them

---
# monitoring-deployment
```monitoring-deployment``` directory contains 3 different monitoring deployments, each directory contains a 2 scripts ```deploy.sh``` and ```destroy.sh``` that can be used to deploy and destroy their corresponding deployments.
### autopilot-deployment
```autopilot-deployment```  directory cotanins monitoring deployment that is compatible with the GKE autopilot mode
### standard-deployment
```standard-deployment``` directory cotanins monitoring deployment that is compatible with the GKE autopilot mode
### standard-kube-prometheus-deployment
```standard-kube-prometheus-deployment``` directory cotanins monitoring deployment based on kube-prometheus repo

---
# canary
```canary``` directory contains everything related to the canary releases
### frontend
```frontend``` directory contains the source code of the v2 and v3 of the frontend used in the canary deployments. It contains 2 scripts to build and push the images to our project's Container Registry
### frontend-latency-test
```frontend-latency-test``` directory contains the source code of the latency test used to verify the canary deployment. It also contains a script to build and push the image to our project's Container Registry 
### gateway
```gateway``` directory contains manifest files and scripts install the canary releases prerequisites, create Google Cloud delivery pipeline and to create releases.

---
# microservices
```microservices``` directory contains the newly added log service with the modified checkout services source codes

---
### CheckoutService
```CheckoutService``` directory contains the source code of the modified checkout service that queries the log service
### LogService
```LogService``` directory contains the source code of the newly added log service

---
# data-collected
```data-collected``` directory contains the csv files collected from locust with the python scripts to visualize them

