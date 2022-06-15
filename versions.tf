terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tamopstf"
    storage_account_name = "seppelfabius"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 0.14"
}

