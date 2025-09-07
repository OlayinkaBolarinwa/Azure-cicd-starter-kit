variable "resource_group" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "my-cicd-rg"
}

variable "location" {
  description = "Azure location for resources"
  type        = string
  default     = "westus2"
}

variable "storage_account_name" {
  description = "Base name for the Azure Storage Account"
  type        = string
  default     = "mycicdstorage001"
}

variable "storage_container_name" {
  description = "Name of the Azure Storage Container"
  type        = string
  default     = "tfstate"
}
