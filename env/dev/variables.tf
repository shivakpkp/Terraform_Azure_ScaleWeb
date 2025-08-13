variable "Vnet_name" {
  type        = string
  description = "description"
}
variable "location" {
  type        = string
  description = "location"
}
variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}
variable "address_space" {
  type        = list(string)
  description = "address space for the VNet"
}   
variable "subnets" {
  type        = map(object({
    subnet_prefix = string
  }))
  description = "list of subnets to be created in the VNet"
}
variable "nsg_name" {
  type        = string
  description = "name of the Network Security Group"
}
variable "security_rule" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "List of security rules for the Network Security Group"
 }