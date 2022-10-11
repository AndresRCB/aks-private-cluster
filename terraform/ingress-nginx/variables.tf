variable "aks_cluster_name" {
  type = string
  description = "AKS cluster name to deploy nginx-ingress to"
}

variable "aks_cluster_resource_group" {
  type = string
  description = "Resource group where the AKS cluster exists"
}