terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "b6fe4715-d2b2-42ab-8084-deaa26fcb5be"
  tenant_id       = "e3b33809-b82f-41d9-89f8-615c1232eeec"
}

resource "azurerm_resource_group" "rg_resource" {
  name     = "rg_resource"
  location = "UK South"
}

resource "azurerm_service_plan" "app_plan" {
  name                = "ybee-app_plan"
  location            = azurerm_resource_group.rg_resource.location
  resource_group_name = azurerm_resource_group.rg_resource.name
  os_type             = "Windows"
  sku_name            = "B1"
}
