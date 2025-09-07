output "resource_group_name" {
  value = azurerm_resource_group.starterkit.name
}

output "storage_account_name" {
  value = azurerm_storage_account.starterkit.name
}

output "storage_container_name" {
  value = azurerm_storage_container.starterkit.name
}
