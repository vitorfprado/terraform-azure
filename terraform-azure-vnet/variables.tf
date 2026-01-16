variable "system" {
  description = "Nome do Sistema"
  type        = string
}

variable "environment" {
  description = "Nome do Ambiente Ex: prod, homolog"
  type        = string
}

variable "location" {
  description = "Região onde os recursos ficaram localizados. Ex: brazilsouth"
  type        = string
}

variable "rg_name" {
  description = "Nome do Resource Group onde os recursos serão criados"
  type        = string
}

variable "vnet_address" {
  description = "Range de ip da vnet, ex: [\"10.0.0.0/16\"]"
  type = list(string)
}

variable "dns_servers" {
  description = "Lista de servidores DNS para a VNet, ex: [\"10.0.0.4\", \"10.0.0.5\"]"
  type        = list(string)
  default = []
}

variable "subnets" {
  description = "Configurações de sub-redes, ver a pasta examples para exemplo de uso"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = optional(list(string))
    }))
  }))
}

