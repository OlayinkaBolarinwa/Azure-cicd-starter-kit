variable "resource_group" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "rg-starterkit"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "EastUS"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name (lowercase, 3-24 chars)"
  default     = "starterkitstorage01"
}

variable "storage_container_name" {
  type        = string
  description = "Storage container name"
  default     = "starterkitcontainer"
}
