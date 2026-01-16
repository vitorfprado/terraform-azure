variable "content_safety_name" {
  description = "Nome do recurso Content Safety"
  type        = string
}

variable "rg_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Localização do recurso"
  type        = string
}

variable "sku_name" {
  description = "SKU do recurso Content Safety"
  type        = string
}

variable "custom_subdomain_name" {
  description = "Nome do subdomínio personalizado"
  type        = string
}

variable "dynamic_throttling_enabled" {
  description = "Habilitar ou não o controle de taxa dinâmico"
  type        = bool
  default     = false
}

variable "default_action" {
  description = "Ação padrão das ACLs de rede"
  type        = string
}

variable "ip_rules" {
  description = "Lista de regras de IP permitidos"
  type        = list(string)
  default     = []
}

variable "identity_ids" {
  description = "Lista de IDs de identidade atribuída"
  type        = list(string)
  default     = []
}

variable "identity_type" {
  description = "Tipo de identidade atribuída"
  type        = string
}