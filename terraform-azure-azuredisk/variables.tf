variable "name" {
  description = "Nome do disco"
  type        = string
}

variable "location" {
  description = "Localização do recurso"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "storage_account_type" {
  description = "Tipo de armazenamento do disco (ex: Standard_LRS, Premium_LRS)"
  type        = string
  default     = "Standard_LRS"
}

variable "disk_size_gb" {
  description = "Tamanho do disco em GB"
  type        = number
}