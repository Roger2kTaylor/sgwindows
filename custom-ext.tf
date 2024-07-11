#####################################################################
# custom-ext.tf 
#####################################################################

#####################################################################
# custom-ext Block 1
#####################################################################

/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1. azurerm_virtual_machine_extension - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension

*/


resource "azurerm_virtual_machine_extension" "vmextension" {
  name                 = "vmextension"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
        "fileUris": ["https://${azurerm_storage_account.stgacct2.name}.blob.core.windows.net/software/ShareGate.24.6.0.msi"],
          "commandToExecute": "msiexec /i ShareGate.24.6.0.msi /q SHAREGATEINSTALLSCOPE=PERMACHINE RESTARTEDASADMIN=1 ALLUSERS=1"     
    }
SETTINGS

}


