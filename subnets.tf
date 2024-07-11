#####################################################################
# subnets.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.${count.index + 1}.0/24"]

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet
  ]

}


