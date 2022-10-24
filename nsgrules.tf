
# Resource-2: Create Network Security Group (NSG)
resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "${var.azure_subnet_nsg}-nsg"
  location            = azurerm_resource_group.devops_rg.location
  resource_group_name = azurerm_resource_group.devops_rg.name
}

/*
# Resource-3: Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.app_nsg_rule_inbound]  
  subnet_id                 = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id

*/

# create NSG Rules
## Locals Block for Security Rules
locals {
  web_inboud_ports_map = {
    "100" : "80", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "443",
    "120" : "22"
  }
}

# NSG Inbound Rules for WebTier Subnets
resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {
  for_each = local.web_inboud_ports_map
    name                            = "Rule-Port-${each.value}"
    priority                        = each.key
    direction                       = "Inbound"
    access                          = "Allow"
    protocol                        = "Tcp"
    source_port_range               = "*"
    destination_port_range          = each.value
    source_address_prefix           = "*"
    destination_address_prefix      = "*"
    resource_group_name             = azurerm_resource_group.devops_rg.name 
    network_security_group_name     = azurerm_network_security_group.web_subnet_nsg.name
  }