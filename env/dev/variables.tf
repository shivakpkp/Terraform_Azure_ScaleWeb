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
  type = map(object({
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

variable "instance_count" {
  type        = number
  description = "number of instances"
  default     = 2
}

variable "vmss_name" {
  type        = string
  description = "ID of the subnet where the scale set will be deployed"
}

variable "PublicIPAddress_name" {
  type        = string
  description = "ID of the subnet where the scale set will be deployed"
}
variable "frontend_port" {
  type        = number
  description = "Frontend port for the Load Balancer rule"
}

variable "backend_port" {
  type        = number
  description = "Backend port for the Load Balancer rule"
}