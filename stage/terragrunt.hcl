# This config is added to a child module if it includes root (this) module

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  features {}
}
EOF
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    resource_group_name  = "trrg-azure-resource-group-tf"
    storage_account_name = "trrgazurestoragetf"
    container_name       = "terraform"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}
