#####################################################################
# variables.tf 
#####################################################################

#####################################################################
# Variables Block 1
#####################################################################

variable "prefix" {
  type        = string
  default     = "app"
  description = "Prefix of the resource name"
}

variable "location" {
  description = "Azure Location"
  type        = string
}

#####################################################################
# Variables Block 2
#####################################################################

variable "environment" {
  description = "Environment Type - Prod/Stage/Dev"
  type        = string
}

variable "owner" {
  description = "Environment Owner"
  type        = string
}

variable "projectcode" {
  description = "Project Code"
  type        = string
}

variable "costcenter" {
  description = "Cost Center"
  type        = string
}

#####################################################################
# Variables Block 3
#####################################################################

variable "vnet_address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
}

variable "subnet_names" {
  description = "Names of the subnets"
  type        = list(string)
  default     = []
  validation {
    condition     = length(var.subnet_names) <= 5
    error_message = "The number of subnets must be less than 5."
  }
}

variable "allocation_method" {
  description = "Public IP Allocation Method"
  type        = string
}


#####################################################################
# Variables Block 4
#####################################################################

variable "admin_username" {
  description = "Windows VM Admin User Name"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Windows VM Admin Password"
  sensitive   = true
  type        = string
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
  default     = "Standard_D2S_v3"
}

variable "os_disk_caching" {
  description = " VM OS Disk Caching"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "OS Disk Storae Account Type"
  type        = string
}

variable "src_img_ref_publisher" {
  description = "Source Image Reference Pubisher"
  type        = string
}

variable "src_img_ref_offer" {
  description = "Source Image Reference Offer"
  type        = string
}

variable "src_img_ref_sku" {
  description = "Source Image Reference Sku"
  type        = string
}

variable "src_img_ref_version" {
  description = "Source Image Reference Version"
  type        = string
}

#####################################################################
# Variables Block 5
#####################################################################

variable "stg_account_tier" {
  description = "Storage Account Tier"
}

variable "stg_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}

variable "stgacct2_name" {
  description = "Storage2 Account Name"
  type        = string
}

variable "storage_container_name" {
  description = "Storage2 Account Container Name"
  type        = string
}

variable "container_access_type" {
  description = "Container Access Type"
  type        = string
}

variable "blob_sharegate_msi" {
  description = "Blob ShareGate MSI"
  type        = string
}

variable "blob_type" {
  description = "Blob Type"
  type        = string
}
