resource "azurerm_resource_group" "devops_rg" {
    name = "$(var.resource_group_name)-$(var.environment)"
    location = var.location1
}