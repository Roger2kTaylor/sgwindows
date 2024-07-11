#####################################################################
#local.tf 
#####################################################################

#####################################################################
# Local Block 1
#####################################################################

# Create common tags and NSG Rules using locals resource
locals {
  common_tags = {
    Environment = var.environment
    Owner       = var.owner
    ProjectCode = var.projectcode
    CostCenter  = var.costcenter
  }

  nsgrules = {

    AllowRDP = {
      name                       = "AllowRDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    AllowHTTP = {
      name                       = "AllowHTTP"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    AllowHTTPS = {
      name                       = "AllowHTTPS"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }
}

