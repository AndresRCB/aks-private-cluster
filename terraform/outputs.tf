output "cluster_invoke_command" {
  value = "az aks command invoke --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.aks_cluster.name} --command \"kubectl get pods -n kube-system\""
  description = "Sample command to execute k8s commands on the cluster using az cli"
}

output "jumpbox_login_command" {
  value = "az network bastion ssh --name ${azurerm_bastion_host.bastion_host.name} --resource-group ${azurerm_resource_group.rg.name} --target-resource-id ${azurerm_virtual_machine.jumpbox_vm.id} --auth-type ssh-key --username ${var.jumpbox_admin_name} --ssh-key ${var.ssh_key_file}"
  description = "Command to connect to the jumpbox VM"
}

output "cluster_credentials_command" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.aks_cluster.name}"
  description = "Command to get the cluster's credentials with az cli"
}

output "cluster_id" {
  value = "az aks show -g ${azurerm_resource_group.rg.name} -n ${azurerm_kubernetes_cluster.aks_cluster.name} --query @.id -o tsv"
  description = "ID of the AKS cluster created by this module"
}

output "aks_cluster_resource_group" {
  value = "${azurerm_resource_group.rg.name}"
  description = "Resource group that holds the AKS cluster"
}

output "aks_cluster_name" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.name}"
  description = "Name of the AKS cluster"
}