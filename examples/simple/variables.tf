variable "name" {
  default = "se48arhqnnjnr"
}

variable "resource_group_name" {
  default = "terraform-test"
}

variable "virtual_network_id" {
  default = "/subscriptions/xxxxx/resourceGroups/terraform-test/providers/Microsoft.Network/virtualNetworks/terraform-test"
}

variable "delegated_subnet_id" {
  default = "/subscriptions/xxxxx/resourceGroups/terraform-test/providers/Microsoft.Network/virtualNetworks/terraform-test/subnets/public-subnet"
}

variable "tags" {
  default = {
    "env" = "test"
  }
}

