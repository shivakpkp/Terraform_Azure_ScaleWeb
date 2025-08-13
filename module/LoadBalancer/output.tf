output "backend_pool_id" {
  value       = azurerm_lb_backend_address_pool.backend_pool.id
  description = "The ID of the backend address pool for the Load Balancer."
}

# output "lb_rule_id" {
#   value       = azurerm_lb_rule.lb_rule.id
#   description = "The ID of the rule associated with the Load Balancer."
# }

output "nat_rule_id" {
  value       = azurerm_lb_nat_rule.nat_lb_rule.id
  description = "The ID of the NAT rule associated with the Load Balancer."
}