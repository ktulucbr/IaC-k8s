variable "appId" {
  description = "myapp_id"
}

variable "password" {
  description = "mypassword123"
}

variable "service_principal_id" {
      description = "Service Principal Id"
      type = string
  }

  variable "service_principal_key" {
      description = "Service Principal Password"
      type = string
  }

  variable "azurerm_spn_tenant_id" {
      description = "Tenant ID for the service principal"
      type = string
  }

  variable "azurerm_subscription_id" {
      description = "Subscription ID for the target subscription"
      type = string
  }
