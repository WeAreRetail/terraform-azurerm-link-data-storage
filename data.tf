# Read storage data lookup for all main storages (not DR) for the corresponding project
data "azurerm_resources" "read_storage" {
  provider = azurerm.target_sub

  type = "Microsoft.Storage/storageAccounts"
  required_tags = merge({
      A_INFRA_REGION = var.disaster_recovery ? "DISASTER_RECOVERY" : "MAIN"
      A_PROJECT      = var.project
      A_ENVIRONMENT  = var.read_env
    },
    var.custom_tags_read_env
  )
}

data "azurerm_resources" "write_storage" {
  provider = azurerm.target_sub

  type = "Microsoft.Storage/storageAccounts"
  required_tags = merge(
    {
      A_INFRA_REGION = var.disaster_recovery ? "DISASTER_RECOVERY" : "MAIN"
      A_PROJECT      = var.project
      A_ENVIRONMENT  = var.write_env
    },
    var.custom_tags_write_env
  ) 
}

# Read storage locals
locals {
  # Get storage except databricks
  read_storage              = one([for storage in data.azurerm_resources.read_storage.resources : storage if !can(regex("databricks", storage.id))])
  read_storage_name         = local.read_storage.name
  read_storage_id           = local.read_storage.id
  read_storage_data_group_name = split("/", local.read_storage_id)[4]
}

# write storage locals
locals {
  # Get storage except databricks
  write_storage             = one([for storage in data.azurerm_resources.write_storage.resources : storage if !can(regex("databricks", storage.id))])
  write_storage_name        = local.write_storage.name
  write_storage_id          = local.write_storage.id
  write_storage_data_group_name = split("/", local.write_storage_id)[4]
  storages = {for index, storage in distinct([local.read_storage, local.write_storage]) : index => storage}
}
