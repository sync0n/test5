output "azurerm_kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.cluster.id
}

output "azurerm_kubernetes_cluster_fqdn" {
  value = azurerm_kubernetes_cluster.cluster.fqdn
}

output "azurerm_kubernetes_cluster_node_resource_group" {
  value = azurerm_kubernetes_cluster.cluster.node_resource_group
}

/*
https://github.com/nicholasjackson/terraform-azure-k8s/blob/master/outputs.tf
*/

output "client_key" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.username}"
}

output "cluster_password" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.password}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config_raw}"
}

output "host" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.host}"
}
