terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
  required_version = ">= 1.3.0"

  backend "azurerm" {
    resource_group_name  = "my-cicd-rg"
    storage_account_name = "mycicdstorage001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "random_id" "rg_suffix" {
  byte_length = 3
}

resource "random_id" "storage_suffix" {
  byte_length = 3
}

resource "azurerm_resource_group" "starterkit" {
  name     = "${var.resource_group}-${random_id.rg_suffix.hex}"
  location = var.location
}

resource "azurerm_storage_account" "starterkit" {
  name                     = "${var.storage_account_name}${random_id.storage_suffix.hex}"
  resource_group_name      = azurerm_resource_group.starterkit.name
  location                 = azurerm_resource_group.starterkit.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "starterkit" {
  name                 = "${var.storage_container_name}-${random_id.storage_suffix.hex}"
  storage_account_name = azurerm_storage_account.starterkit.name
  container_access_type = "private"
}

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
