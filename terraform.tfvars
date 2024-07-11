#####################################################################
# terraform.tfvars
#####################################################################

#####################################################################
# terraform.tfvars Block 1
#####################################################################

# General 
prefix   = "sgate"
location = "East Us"

# Common Tags
environment = "Dev"
owner       = "Roger Taylor"
projectcode = "0123"
costcenter  = "C8956"

#####################################################################
# terraform.tfvars Block 2
#####################################################################

# Virtual Network
vnet_address_space = ["10.0.0.0/16"]
subnet_names       = ["sg-subnet1"]

# Public IP
allocation_method = "Static"

#####################################################################
# terraform.tfvars Block 3
#####################################################################

# VM Credentials
admin_username = "adminuser"
admin_password = "Azure@123"

# VM Configuration
vm_size                      = "Standard_D2S_v3"
os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Standard_LRS"

src_img_ref_publisher = "MicrosoftWindowsServer"
src_img_ref_offer     = "WindowsServer"
src_img_ref_sku       = "2022-Datacenter"
src_img_ref_version   = "latest"

# VM diagnostic Storage Account
stg_account_tier             = "Standard"
stg_account_replication_type = "LRS"

stgacct2_name          = "sg987464879"
storage_container_name = "software"
container_access_type  = "container"

blob_sharegate_msi = "ShareGate.24.6.0.msi"
blob_type          = "Block"