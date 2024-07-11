#####################################################################
# output.tf 
#####################################################################

#####################################################################
# Output Block 1
#####################################################################

# Resource Group Name
output "rg_name" {
  value = azurerm_resource_group.rg.name
}

# Resource Group Location
output "rg_location" {
  value = azurerm_resource_group.rg.location
}

#####################################################################
# Output Block 2
#####################################################################

# Virtual Network Name
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

# Virtual Network Address 
output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

# Subnet Names 
output "subnets" {
  value = var.subnet_names
}

# Network Interface
output "nic_name" {
  value = azurerm_network_interface.nic.name
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.vm.public_ip_address
}
