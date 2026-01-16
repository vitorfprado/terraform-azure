variable "rg_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Localização do recurso"
  type        = string
  default     = "BrazilSouth"
}

variable "system" {
  description = "Nome do sistema"
  type        = string
}

variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "acr_sku" {
  description = "Tier do ACR (Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}
