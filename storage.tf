resource "azurerm_storage_account" "storage" {
  name                     = "ybeeuniquestorageolay1"  # lowercase & unique
  resource_group_name       = azurerm_resource_group.rg_resource.name
  location                 = azurerm_resource_group.rg_resource.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = true
  is_hns_enabled           = false
}
