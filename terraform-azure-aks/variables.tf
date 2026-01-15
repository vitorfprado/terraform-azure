variable "rg_name" {
  description = "Nome do grupo de recursos"
  type        = string
}
variable "location" {
  description = "Localização do recurso"
  type        = string
  default     = "BrazilSouth"
}
variable "cluster_sku" {
  description = "Tier do node de sistema"
  type        = string
  default     = "Free"
}
variable "system" {
  description = "Nome do sistema"
  type        = string
}
variable "environment" {
  description = "Nome do ambiente"
  type        = string
}
variable "dns_prefix" {
  description = "Prefixo de DNS do cluster"
  type        = string
}
variable "node_pool_name" {
  description = "Nome do pool de nodes (pool de nodes: grupo de vm´s)"
  type        = string
}
variable "node_tier" {
  description = "Tier dos nodes dentro do pool"
  type        = string
  default     = "Standard_a2_v2"
}
variable "node_amount" {
  description = "Quantidades de nodes no pool"
  type        = number
}
variable "node_labels" {
  description = "Labels para os nodes do pool padrão"
  type        = map(string)
  default     = {}
}
variable "enable_node_pool" {
  description = "Habilitar a criação de mais node pools, além do pool padrão criado junto ao cluster"
  type        = bool
}
variable "node_pool_config" {
  description = "Mapa de objetos para configurar pool de nodes, seguir no padrão nome_pool = {node_tier = x, node_amount = x, node_labels = {'key' = 'value'}, enable_node_pool_auto_scale = bool, min_nodes_per_pool = x, max_nodes_per_pool = x}"
  type = map(object({
    node_tier   = string
    node_amount = number
    node_labels = optional(map(string))
    enable_node_pool_auto_scale = bool
    max_nodes_per_pool = optional(number)
    min_nodes_per_pool = optional(number)
  }))
  default = {}
}
variable "enable_csi" {
  description = "Habilitar integração do AKS com o Keyvault"
  type        = bool
  default     = false
}
variable "csi_rotation" {
  description = "Intervalo de tempo nas consultas do AKS ao Keyvault"
  type        = string
  default     = "5m"
}

variable "enable_oidc" {
  description = "Habilitar o OIDC"
  type        = string
  default     = false
}

variable "enable_workload_identity" {
  description = "Habilitar utilização do Workload Identity"
  type        = string
  default     = false
}

variable "enable_azure_adrbac" {
  description = "Habilitar integração com Azure AD"
  type        = bool
  default     = false
}

variable "azure_ad_admin_group_object_ids" {
  description = "Lista de Object IDs dos grupos do Azure AD que terão privilégios de admin no cluster"
  type        = list(string)
  default     = []
}

variable "tenant_id" {
  description = "Tenant ID do Azure AD"
  type        = string
  default     = ""
}

variable "enable_azure_rbac" {
  description = "Habilitar Azure RBAC para controle de acesso baseado em função no cluster AKS"
  type        = bool
  default     = false

}