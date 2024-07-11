#####################################################################
# storage.tf 
#####################################################################

#####################################################################
# Resource Block 1
#####################################################################

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "stgacct" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.stg_account_tier
  account_replication_type = var.stg_account_replication_type

}

# Create storage for ShareGate Software
resource "azurerm_storage_account" "stgacct2" {
  name                     = var.stgacct2_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.stg_account_tier
  account_replication_type = var.stg_account_replication_type
}

resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.stgacct2.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "sharegate_msi" {
  name                   = var.blob_sharegate_msi
  storage_account_name   = azurerm_storage_account.stgacct2.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = var.blob_type
  source                 = var.blob_sharegate_msi
}

