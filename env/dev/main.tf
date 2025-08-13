module "network" {
  source = "github.com/shivakpkp/terraform-azure-network"

  Vnet-name           = var.Vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  subnets             = var.subnets
  nsg_name            = var.nsg_name
  security_rule       = var.security_rule
}

module "Scale-Set" {
  source              = "../../module/Scale-Set"
  depends_on          = [module.network]
  resource_group_name = var.resource_group_name
  location            = var.location
  instance_count      = var.instance_count
  subnet_id           = module.network.subnet_id["subnet-2"]
  vmss_name           = var.vmss_name
  # Ensure the subnet_id is correctly passed from the network module
  # Adjust the index [0] if you have multiple subnets and need a different one
}