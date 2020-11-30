include {
  path = find_in_parent_folders()
}

dependency "resource_group" {
  config_path = "../resource_group"
}

terraform {
  source = "../../modules//storage_account"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.resource_group_name
}
