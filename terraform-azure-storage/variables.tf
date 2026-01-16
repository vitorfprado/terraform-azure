variable "sto_name" {
  description = "Nome do storage account"
  type        = string
}
variable "location" {
  description = "Localização onde o recurso será criado"
  type        = string
}
variable "rg_name" {
  description = "Nome do grupo de recursos a ser utilizado"
  type        = string
}
variable "sto_account_tier" {
  description = "Tier do storage account, valor default = Standard"
  type        = string
  default     = "Standard"
}
variable "sto_account_replication" {
  description = "Tipo de replicação do storage account, valor default = LRS"
  type        = string
  default     = "LRS"
}
variable "account_kind" {
  description = "Tipo de conta a ser utilizada"
  type        = string
  default     = "Storage"
}
variable "public_network_access_enabled" {
  description = "Permitir ou não o acesso público ao servidor"
  type        = string
  default     = "true"
}

variable "allow_nested_items_to_be_public" {
  description = "Permitir ou não que itens aninhados sejam públicos"
  type        = bool
  default     = true
}

variable "default_to_oauth_authentication" {
  description = "Definir autenticação OAuth como padrão"
  type        = bool
  default     = false
}
variable "sto_containers" {
  description = "Mapa de string, onde serão definidos os containers, devem ser criados no padrão {nome-container = 'tipo-container'}"
  type        = map(string)
  default     = {}
}
variable "sto_queues" {
  description = "Mapa de string, onde serão definidas as queues, devem ser criadas no padrão {chave-qualquer = 'nome-queue'}"
  type        = map(string)
  default     = {}
}
variable "sto_tables" {
  description = "Set de string, onde serão definidas as tabelas, devem ser criadas no padrão ['nome1', 'nome2']"
  type        = set(string)
  default     = []
}