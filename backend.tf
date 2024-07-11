#####################################################################
# backend.tf 
#####################################################################

terraform {
  backend "azurerm" {
    resource_group_name  = "remotestate-rg"
    storage_account_name = "azremotebackend"
    container_name       = "tfstate"
    key                  = "skyenets/examples/vm/sgwindow/terraform.tfstate"
  }
}

/*
# Optional: Encrypt the state file with a key vault
encrypt {
  enabled = true
  kms_key_id = "/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/YOUR_KEYVAULT_RESOURCE_GROUP/providers/Microsoft.KeyVault/vaults/YOUR_KEYVAULT_NAME/keys/YOUR_KEY_NAME"
}

*/
