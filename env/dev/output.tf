output vnet_id {
  description = "The ID of the virtual network"
  value       = module.network.vnet_id
  sensitive   = false
} 

output subnet_id {
    value       = module.network.subnet_id
}

output vnet_name {
    value       = module.network.vnet_name
}

output network_security_group_id {
    value       = module.network.network_security_group_id
}