variable "system" {
  description = "Nome do sistema do recurso"
  type        = string
}
variable "environment" {
  description = "Nome do ambiente do recurso"
  type        = string
}
variable "location" {
  description = "Localização do recurso"
  type        = string

}
variable "rg_name" {
  description = "Nome do grupo de recurso"
  type        = string
}
variable "resource" {
  description = "Nome do application insight"
  type        = string
}
variable "type" {
  description = "Tipo de application insight"
  type        = string
}
variable "retention_in_days" {
  description = "Valor para definir o número de dias de retenção"
  type        = number
  default     = 30
}





