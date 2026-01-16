variable "enable_rg" {
    description = "Habilitar ou não a criação do grupo de recursos utilizando este módulo"
    type = bool
}
variable "location" {
    description = "Localização onde o recurso será provisionado"
    type = string
}
variable "system" {
    description = "Nome do sistema"
    type = string
}
variable "environment" {
    description = "Nome do ambiente"
    type = string
}
variable "rg_name" {
    description = "Nome do grupo de recursos, definir apenas caso for criá-lo utilizando outro módulo"
    type = string
    default = null
}
variable "asp_kind_os" {
    description = "Sistema operacional utilizado no ASP, Linux ou Windows"
    type = string
}
variable "asp_size" {
    description = "Tier do ASP: S1, B1..."
    type = string
}
variable "enable_autoscale" {
    description = "Habilitar ou não o auto-scale"
    type = bool
}


