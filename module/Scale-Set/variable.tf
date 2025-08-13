variable "location" {
  type        = string
  description = "location"
}
variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "instance_count" {
  type        = number
  description = "number of instances"
  default     = 1
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the scale set will be deployed"
}

variable "vmss_name" {
  type        = string
  description = "Admin username for the virtual machine scale set"
}