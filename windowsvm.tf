#####################################################################
# windowsvm.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

# Create Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "${var.prefix}-vm"
  computer_name       = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  # Common Tags 
  tags = local.common_tags

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    name                 = "${var.prefix}-OsDisk"
  }

  source_image_reference {
    publisher = var.src_img_ref_publisher
    offer     = var.src_img_ref_offer
    sku       = var.src_img_ref_sku
    version   = var.src_img_ref_version
  }

  depends_on = [
    azurerm_network_interface.nic,
    azurerm_resource_group.rg,
    azurerm_storage_account.stgacct
  ]

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stgacct.primary_blob_endpoint
  }

}
