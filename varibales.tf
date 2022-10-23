# https://www.terraform.io/docs/configuration/variables.html
# Input Variables
# Output Values
# Local Values (Optional)

# Define Input Variables
# 1. Azure Location (CentralUS)
# 2. Azure Resource Group Name 
# 3. Azure AKS Environment Name (Dev, QA, Prod)

variable "resource_group_name" {
  type        = string
  description = "This variable defines Resource Group"
  default     = "vyreddyrg"

}

variable "location1" {
  type        = string
  description = "This varibale defines resource location"
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "This variable defines Environment"
  default     = "dev"
}

# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "myvnet"
}

variable "virtual_network_address" {
  description = "Virtual Network Address Space"
  type        = list(string)
  default     = ["10.20.0.0.0/16"]
}


# subnet address range specification
variable "subnet_range" {
  default = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
  type    = list(string)
}

/*
# 6. Subnet Name
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string 
}


# 7. Public IP Name
variable "publicip_name" {
  description = "Public IP Name"
  type = string 
}
# 8. Network Interfance
variable "network_interface_name" {
  description = "Network Interface Name"
  type = string 
}

# 9. Virtual Machine Name
variable "virtual_machine_name" {
  description = "Virtual Machine Name"
  type = string 
}
*/

