# Using the CLI to deploy ingress-nginx
This section shows how to deploy the ingress-nginx controller to the cluster via CLI. This is particularly important when using terraform from a development machine and not a CI/CD pipeline, given that development machines often won't have access to the private cluster (unless it's a bastion server or in a VPN with the cluster)

## Deploy ingress-nginx with helm
We will use mostly default values for our helm chart, only overriding the load balancer type to get an internal standard load balancer.

```sh
# MAKE SURE THAT YOU HAVE ACCESS TO THE CLUSTER WITH kubectl AND helm.

# Installing helm commands (in case you need them):
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# From within the ingress-nginx/cli directory, run the following commands.s
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm install ingress-nginx ingress-nginx/ingress-nginx \
    --version 4.3.0 \
    --namespace ingress-nginx \
    --create-namespace \
    -f ../ingress-nginx.yaml
```
