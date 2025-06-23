output "read_storage_id" {
  description = "The ID of the read storage account"
  value       = local.read_storage_id
}

output "read_storage_name" {
  description = "The name of the read storage account"
  value       = local.read_storage_name
}

output "read_storage_resource_group_name" {
  description = "The resource group name of the read storage account"
  value       = local.read_storage_data_group_name
}

output "storages_map" {
  description = "Map of all storage accounts, including read and write. The key is the name of the storage account, and the value is the storage account object."
  value       = local.storages_map
}

output "storages" {
  description = "Map of all storage accounts, including read and write. The key is the index of the storage in the list, and the value is the storage account object."
  value       = local.storages
}

output "write_storage_id" {
  description = "The ID of the write storage account"
  value       = local.write_storage_id
}

output "write_storage_resource_group_name" {
  description = "The resource group name of the write storage account"
  value       = local.write_storage_data_group_name
}

output "write_storage_name" {
  description = "The name of the write storage account"
  value       = local.write_storage_name
}
