variable "location" {
  default = "northeurope"
}

variable "resource_group_name" {
  default = "rg-terraform-pro1"
}

variable "admin_username" {
  default = "azureadmin"
}

variable "admin_public_key" {
  description = "SSH public key"
}