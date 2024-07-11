#####################################################################
# main.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

# Create Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location

  # Common Tags 
  tags = local.common_tags
}

