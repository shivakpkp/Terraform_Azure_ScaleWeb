resource "azurerm_resource_group" "RG_name" {
  name     = var.resource_group_name
  location = var.location
}