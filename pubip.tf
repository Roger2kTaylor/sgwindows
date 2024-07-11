#####################################################################
# publicip.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

resource "azurerm_public_ip" "publicip" {
  name                = "${var.prefix}-pubip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = "Standard"
  # Common Tags 
  tags = local.common_tags

  depends_on = [azurerm_resource_group.rg]

}

/*
If this resource is to be associated with a resource that requires disassociation before destruction (such as azurerm_network_interface) it is recommended to set the lifecycle argument create_before_destroy = true. Otherwise, it can fail to disassociate on destruction.
*/

