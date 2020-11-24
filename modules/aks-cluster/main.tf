resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = var.default_pool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id  = var.vnet_subnet_id
    max_pods        = var.max_pods
    type            = var.default_pool_type
/*
    enable_auto_scaling = false
    min_count           = var.min_count
    max_count           = var.max_count
*/
    tags = merge(
    {
       "environment" = "runitoncloud"
    },
    {
      "aadssh" = "True"
    },
  )
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = "calico"
    service_cidr       = var.service_cidr
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }



 tags = {
        Environment = "Development"
    }

  lifecycle {
    prevent_destroy = true
  }  
}

resource "helm_release" "nginx-ingress" {
name = "nginx-ingress-internal"
chart = "nginx-ingress"
repository = "https://charts.helm.sh/stable"

  set {
    name  = "controller.replicaCount"
    value = "2"
  }

  set {
    name  = "controller.nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }

  set {
    name  = "defaultBackend.nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }
}


