resource "random_pet" "prefix" {}

resource "random_string" "random" {
  length           = 32
  special          = false
  upper	           = false
}

provider "azurerm" {
  features {}
}

# Create the resource group to host our k8s cluster
resource "azurerm_resource_group" "default" {
  name     = "${random_pet.prefix.id}-rg"
  location = "WestEurope"

  tags = {
    environment = "Demo"
  }
}

# The container registry
resource "azurerm_container_registry" "default" {
  #name                     = "thismustbeunique"
  name                     = "${random_string.random.id}"
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  sku                      = "Basic"
  admin_enabled            = true

  tags = {
    environment = "Demo"
  }
}

# The k8s cluster
resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "standard_d2ads_v5"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}
