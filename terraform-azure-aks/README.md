<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.kubernete_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.kubernete_node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_ad_admin_group_object_ids"></a> [azure\_ad\_admin\_group\_object\_ids](#input\_azure\_ad\_admin\_group\_object\_ids) | Lista de Object IDs dos grupos do Azure AD que terão privilégios de admin no cluster | `list(string)` | `[]` | no |
| <a name="input_cluster_sku"></a> [cluster\_sku](#input\_cluster\_sku) | Tier do node de sistema | `string` | `"Free"` | no |
| <a name="input_csi_rotation"></a> [csi\_rotation](#input\_csi\_rotation) | Intervalo de tempo nas consultas do AKS ao Keyvault | `string` | `"5m"` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo de DNS do cluster | `string` | n/a | yes |
| <a name="input_enable_azure_adrbac"></a> [enable\_azure\_adrbac](#input\_enable\_azure\_adrbac) | Habilitar integração com Azure AD | `bool` | `false` | no |
| <a name="input_enable_azure_rbac"></a> [enable\_azure\_rbac](#input\_enable\_azure\_rbac) | Habilitar Azure RBAC para controle de acesso baseado em função no cluster AKS | `bool` | `false` | no |
| <a name="input_enable_csi"></a> [enable\_csi](#input\_enable\_csi) | Habilitar integração do AKS com o Keyvault | `bool` | `false` | no |
| <a name="input_enable_node_pool"></a> [enable\_node\_pool](#input\_enable\_node\_pool) | Habilitar a criação de mais node pools, além do pool padrão criado junto ao cluster | `bool` | n/a | yes |
| <a name="input_enable_oidc"></a> [enable\_oidc](#input\_enable\_oidc) | Habilitar o OIDC | `string` | `false` | no |
| <a name="input_enable_workload_identity"></a> [enable\_workload\_identity](#input\_enable\_workload\_identity) | Habilitar utilização do Workload Identity | `string` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Nome do ambiente | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Localização do recurso | `string` | `"BrazilSouth"` | no |
| <a name="input_node_amount"></a> [node\_amount](#input\_node\_amount) | Quantidades de nodes no pool | `number` | n/a | yes |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | Labels para os nodes do pool padrão | `map(string)` | `{}` | no |
| <a name="input_node_pool_config"></a> [node\_pool\_config](#input\_node\_pool\_config) | Mapa de objetos para configurar pool de nodes, seguir no padrão nome\_pool = {node\_tier = x, node\_amount = x, node\_labels = {'key' = 'value'}, enable\_node\_pool\_auto\_scale = bool, min\_nodes\_per\_pool = x, max\_nodes\_per\_pool = x} | <pre>map(object({<br/>    node_tier   = string<br/>    node_amount = number<br/>    node_labels = optional(map(string))<br/>    enable_node_pool_auto_scale = bool<br/>    max_nodes_per_pool = optional(number)<br/>    min_nodes_per_pool = optional(number)<br/>  }))</pre> | `{}` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | Nome do pool de nodes (pool de nodes: grupo de vm´s) | `string` | n/a | yes |
| <a name="input_node_tier"></a> [node\_tier](#input\_node\_tier) | Tier dos nodes dentro do pool | `string` | `"Standard_a2_v2"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do grupo de recursos | `string` | n/a | yes |
| <a name="input_system"></a> [system](#input\_system) | Nome do sistema | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID do Azure AD | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id) | n/a |
| <a name="output_node_pools"></a> [node\_pools](#output\_node\_pools) | n/a |
<!-- END_TF_DOCS -->