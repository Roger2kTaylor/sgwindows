#####################################################################
# network.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space

  # Common Tags
  tags = local.common_tags

  depends_on = [azurerm_resource_group.rg]

}


