resource "azurerm_storage_account" "stgaccount" {
  name                     = "${var.environment}${var.resource_group_name}002"
  resource_group_name      = azurerm_resource_group.devops_rg.name
  location                 = azurerm_resource_group.devops_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}