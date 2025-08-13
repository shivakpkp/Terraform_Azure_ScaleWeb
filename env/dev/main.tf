module "network" {
  source = "https://github.com/shivakpkp/terraform-azure-network"

  Vnet-name           = var.Vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  subnets             = var.subnet_name
  nsg_name            = var.nsg_name
  security_rule       = var.security_rule
  }