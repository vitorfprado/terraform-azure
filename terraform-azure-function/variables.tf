variable "rg_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Região onde o recurso ficará alocado. Ex: southbrazil"
  type        = string
}
variable "asp_name" {
  description = "Nome do asp"
  type        = string
}
variable "function_name" {
  description = "Nome da function"
  type        = string
}

variable "asp_size" {
  description = "Plano do ASP da Function. Ex: Dynamic, ElasticPremium"
  type        = string
}

variable "asp_kind" {
  description = "Tipo do Sistema Operacional do ASP. Ex: FunctionApp, Windows, Linux"
  type        = string
}

variable "function_os" {
  description = "Tipo de sistema operacional a ser utilizado pela function, Ex: linux e windows."
}

variable "app_settings_variables" {
  description = "Variáveis de ambiente do aplicativo"
  type        = map(string)
  default     = {}
}
variable "connection_strings" {
  description = "Strings de conexão do aplicativo"
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}

variable "function_version" {
  description = "Versão da Function. Ex: ~4"
  type        = string
}

variable "sto_account_access_key" {
  description = "Access Key do Storage do qual a function depende"
  type        = string
}

variable "sto_account_name" {
  description = "Nome do storage do qual a function depende"
  type        = string
}

variable "stack_version" {
  description = "Versão da stack da function"
  type        = string
}

variable "runtime_stack" {
  description = "Stack na qual a function será executada"
  type        = string
}
variable "use_dotnet_isolated_runtime" {
  description = "Usar dotnet isolated runtime ou não"
  type        = bool
  default     = true
}
variable "use_32_bit_worker" {
  description = "Definir a platarforma para 32 bits(true) ou 64 bits(false)"
  type        = bool
  default     = false
}
variable "allow_ftp" {
  description = "Permitir ou não o FTP"
  type        = string
  default     = "FtpsOnly"
}
variable "enable_scm" {
  description = "Permitir ou não a autenticação básica para o Kudu/SCM endpoint"
  type        = bool
  default     = true
}

variable "enable_appi" {
  description = "Habilita ou desabilita váriavel do Application Insights"
  type        = bool
}

variable "application_insights_connection_string" {
  description = "String de conexão do Application Insights"
  type        = string
  default     = null
}
variable "allowed_origins" {
  description = "Lista de origens permitidas para CORS"
  type        = list(string)
  default     = []
}

variable "support_credentials" {
  description = "Habilitar ou não suporte a credenciais em CORS"
  type        = bool
  default     = false
}
variable "sticky_app_settings" {
  description = "Lista de nomes de app settings que devem ser mantidos entre slots"
  type        = list(string)
  default     = []
}

variable "sticky_connection_strings" {
  description = "Lista de nomes de connection strings que devem ser mantidas entre slots"
  type        = list(string)
  default     = []
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = "Habilitar ou não autenticação básica para WebDeploy"
  type        = bool
  default     = true
}
variable "ftp_publish_basic_authentication_enabled" {
  description = "Habilitar ou não autenticação básica para publicação via FTP"
  type        = bool
  default     = false
}

variable "builtin_logging_enabled" {
  description = "Habilitar ou não o log interno (builtin logging)"
  type        = bool
  default     = true
}

variable "client_certificate" {
  description = "Habilitar ou não o uso de certificado de cliente"
  type        = string
  default     = "Optional"
}

variable "enable_cors" {
  type        = bool
  default     = false
  description = "Define se o CORS será configurado"
}

variable "enable_sticky_settings" {
  type        = bool
  default     = false
  description = "Define se as configurações sticky devem ser criadas"
}

variable "elastic_instance_minimum" {
  type        = number
  default     = 1
  description = "Número de instancias para essa function"
}
