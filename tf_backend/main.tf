terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Root module should specify the maximum provider version
      # The ~> operator is a convenient shorthand for allowing only patch releases within a specific minor release.
      version = "~> 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name = "trrg-azure-resource-group-tf"
  location = "East US"
}

resource "azurerm_storage_account" "storage_account" {
  name = "trrgazurestoragetf"
  resource_group_name = azurerm_resource_group.resource_group.name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name = "terraform"
  storage_account_name = azurerm_storage_account.storage_account.name
}
