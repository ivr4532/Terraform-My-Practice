# Create Virtual Network
resource "azurerm_virtual_network" "myvent" {
  resource_group_name = azurerm_resource_group.devops_rg.name
  location = azurerm_resource_group.devops_rg.location
  name = "myvent-1"
  address_space = ["10.20.0.0/16"]

}

# Create Network Subnet
resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet-1"
    resource_group_name = azurerm_resource_group.devops_rg.name
    virtual_network_name = azurerm_virtual_network.myvent
    address_prefixes = ["10.20.0.0/24"]
  
}