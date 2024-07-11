#####################################################################
# nsg.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

# Create Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  # Common Tags 
  tags = local.common_tags

  depends_on = [azurerm_resource_group.rg]

}

#####################################################################
# Resource Block 2
#####################################################################

# Associate Network Security Group to Subnet 
resource "azurerm_subnet_network_security_group_association" "nsg-link" {
  subnet_id                 = azurerm_subnet.subnets[0].id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [
    azurerm_virtual_network.vnet,
    azurerm_network_security_group.nsg
  ]

}

