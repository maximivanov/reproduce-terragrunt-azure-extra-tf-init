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

resource "azurerm_storage_account" "storage_account" {
  name                     = "terragruntazuredemostrg"
  resource_group_name      = var.resource_group_name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

variable "resource_group_name" {
  type = string
  description = "Resource group name"
}
