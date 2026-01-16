variable "location" {
  description = "Localização onde o recurso será provisionado"
  type        = string
}
variable "system" {
  description = "Nome do sistema"
  type        = string
}
variable "environment" {
  description = "Nome do ambiente"
  type        = string
}
variable "rg_name" {
  description = "Nome do grupo de recursos, definir apenas caso for criá-lo utilizando outro módulo"
  type        = string
  default     = null

}
variable "enable_asp" {
  description = "Habilitar ou não a criação do ASP"
  type        = bool
}
variable "asp_id" {
  description = "Id do asp, definir apenas caso o asp for criado utilizando outro módulo"
  type        = string
  default     = null

}
variable "asp_kind_os" {
  description = "Sistema operacional do asp, definir apenas caso o asp for criado dentro deste módulo"
  type        = string
  default     = null
}
variable "asp_size" {
  description = "Tier do asp, definir apenas caso o asp for criado dentro deste módulo"
  type        = string
  default     = null
}
variable "enable_autoscale" {
  description = "Habilitar ou não o autoscale"
  type        = bool
}
variable "enable_appi_webapp" {
  description = "Habilitar ou não a criação do application insights"
  type        = bool

}
variable "enable_slot" {
  description = "Habilitar ou não a criação de slots"
  type        = bool

}
variable "app_webapp_slot_name" {
  description = " Nome do slot criado"
  type        = string
  default     = null

}
variable "app_settings_variables" {
  description = "Variáveis de ambiente do aplicativo"
  type        = map(string)
  default     = {}
}
variable "enable_diagnostics" {
  description = "Habilitar ou não os diagnósticos"
  type        = bool

}
variable "appi_type" {
  description = "Tipo do application insights"
  type        = string
  default     = null

}
variable "app_command_line" {
  description = "Comando de inicialização do webapp, opcional"
  type        = string
  default     = null
}
variable "web_app_os" {
  description = "Define se o recurso criado será um linux webapp ou windows webapp"
  type        = string
}
variable "enable_health_check_path" {
  description = "Habilitar ou não o health check path"
  type        = bool

}
variable "health_check_path" {
  description = "Caminho para onde será enviado o health check"
  type        = string
  default     = null
}
variable "health_check_eviction_time_in_min" {
  description = "Tempo em minutos para que uma instância não saudável seja removida"
  type        = string
  default     = null
}

variable "logs_retention_in_days" {
  description = "Retenção de logs em dias"
  type        = number
  default     = 7
}

variable "application_stack" {
  description = "Objeto para definir o tipo de linguagem do webapp, definir languague e version dentro de um objeto"
  type = object({
    language = string
    version  = string
  })
  default = {
    language = "node"
    version  = "20-lts"
  }
}

variable "enable_vnet_integration" {
  description = "Habilitar a integração do webapp com a vnet"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "Id da subnet a ser conectada"
  type        = string
  default     = null
}


