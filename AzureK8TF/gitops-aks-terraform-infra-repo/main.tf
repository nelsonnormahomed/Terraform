# Create a new AKS cluster in the East US 2 region

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = "5e276ecd-7083-4a79-a3c3-f6feb2e8f918"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = var.vm_size  # Uses the VM size variable
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.vm_size  # Uses the same VM size variable
  node_count            = 1
  mode                  = "User"

  node_labels = {
    "nodepool-type" = "user-nodes"
  }
}