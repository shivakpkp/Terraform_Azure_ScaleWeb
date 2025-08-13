module "network" {
  source              = "github.com/shivakpkp/terraform-azure-network"
  depends_on          = [azurerm_resource_group.RG_name]
  Vnet-name           = var.Vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  subnets             = var.subnets
  nsg_name            = var.nsg_name
  security_rule       = var.security_rule
}
module "LoadBalancer" {
  source               = "../../module/LoadBalancer"
  depends_on           = [module.network, azurerm_resource_group.RG_name]
  resource_group_name  = var.resource_group_name
  location             = var.location
  PublicIPAddress_name = var.PublicIPAddress_name
  frontend_port        = var.frontend_port
  backend_port         = var.backend_port
}

module "Scale-Set" {
  source              = "../../module/Scale-Set"
  depends_on          = [module.network, module.LoadBalancer, azurerm_resource_group.RG_name]
  resource_group_name = var.resource_group_name
  location            = var.location
  instance_count      = var.instance_count
  subnet_id           = module.network.subnet_id["subnet-2"]
  vmss_name           = var.vmss_name
  nat_rule_id         = module.LoadBalancer.nat_rule_id
  bk_pool_id          = module.LoadBalancer.backend_pool_id
  # Ensure the subnet_id is correctly passed from the network module
  # Adjust the index [0] if you have multiple subnets and need a different one
}