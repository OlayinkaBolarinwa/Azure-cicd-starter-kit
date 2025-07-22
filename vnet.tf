resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_resource.location
  resource_group_name = azurerm_resource_group.rg_resource.name
}

resource "azurerm_subnet" "subnet_id" {
  name                 = "subnet_id"
  resource_group_name  = azurerm_resource_group.rg_resource.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "ybee-nic"
  location            = azurerm_resource_group.rg_resource.location
  resource_group_name = azurerm_resource_group.rg_resource.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet_id.id
    private_ip_address_allocation = "Dynamic"
  }
}
