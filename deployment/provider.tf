/*
terraform {
  backend "azurerm" {}
}
*/

provider "azurerm" {
  version = "~> 2.4"
  features {}
}

provider "helm" {
  version = "1.2.2"
  kubernetes {
    host                   =  module.aks-cluster.host 
    client_certificate     =  base64decode(module.aks-cluster.client_certificate)
    client_key             =  base64decode(module.aks-cluster.client_key)
    cluster_ca_certificate =  base64decode(module.aks-cluster.cluster_ca_certificate)
    load_config_file       = false
  }
}

