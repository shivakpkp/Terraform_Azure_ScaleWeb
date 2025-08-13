resource "azurerm_public_ip" "PIP" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "LB" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.PublicIPAddress_name
    public_ip_address_id = azurerm_public_ip.PIP.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.LB.id
  name            = "BackEndAddressPool"
}

# resource "azurerm_lb_rule" "lb_rule" {
#   loadbalancer_id                = azurerm_lb.LB.id
#   name                           = "HTTPRule"
#   protocol                       = "Tcp"
#   frontend_port                  = var.frontend_port
#   backend_port                   = var.backend_port
#   frontend_ip_configuration_name = var.PublicIPAddress_name
# }

resource "azurerm_lb_nat_rule" "nat_lb_rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.LB.id
  name                           = "HTTPRule_NAT"
  protocol                       = "Tcp"
  frontend_port_start            = 76
  frontend_port_end              = var.frontend_port
  # frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
  frontend_ip_configuration_name = var.PublicIPAddress_name
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.LB.id
  name            = "ssh-running-probe"
  port            = 22
}