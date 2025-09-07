terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

# ---------------- Resource Group ----------------
resource "azurerm_resource_group" "starterkit" {
  name     = var.resource_group
  location = var.location
}

# ---------------- Storage Account ----------------
resource "azurerm_storage_account" "starterkit" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.starterkit.name
  location                 = azurerm_resource_group.starterkit.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# ---------------- Storage Container ----------------
resource "azurerm_storage_container" "starterkit" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.starterkit.name
  container_access_type = "private"
}

# ---------------- Storage Management Policy ----------------
resource "azurerm_storage_management_policy" "starterkit_policy" {
  storage_account_id = azurerm_storage_account.starterkit.id

  rule {
    name    = "cleanup"
    enabled = true

    filters {
      blob_types = ["blockBlob"]
    }

    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 30
      }
    }
  }
}
