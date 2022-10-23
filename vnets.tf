# Create Virtual Network
resource "azurerm_virtual_network" "myvent" {
  resource_group_name = azurerm_resource_group.devops_rg.name
  location            = azurerm_resource_group.devops_rg.location
  name                = "myvent-1"
  address_space       = var.virtual_network_address

}

# Create Network Subnet
resource "azurerm_subnet" "mysubnet" {
  count                = 3
  name                 = "az-subnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.devops_rg.name
  virtual_network_name = azurerm_virtual_network.myvent.name
  address_prefixes     = [element(var.subnet_range, count.index)]

}