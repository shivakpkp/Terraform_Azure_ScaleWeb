variable "location" {
  type        = string
  description = "location"
}
variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "PublicIPAddress_name" {
  type        = string
  description = "Name of the public IP address for the Load Balancer frontend configuration"
}

variable "frontend_port" {
  type        = number
  description = "Frontend port for the Load Balancer rule"
  default     = 80
}
variable "backend_port" {
  type        = number
  description = "Backend port for the Load Balancer rule"
  default     = 80
}