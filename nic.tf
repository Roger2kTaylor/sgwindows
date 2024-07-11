#####################################################################
# nic.tf 
#####################################################################

#####################################################################
# Resource Block 1
####################################################################

# Create Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  # Common Tags 
  tags = local.common_tags
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }

  depends_on = [
    azurerm_subnet.subnets
  ]
}

