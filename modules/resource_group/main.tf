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

resource "azurerm_resource_group" "resource_group" {
  name     = "terragrunt-azure-demo-resource-group"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}
