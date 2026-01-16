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
| [azurerm_cognitive_account.content_safety](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_safety_name"></a> [content\_safety\_name](#input\_content\_safety\_name) | Nome do recurso Content Safety | `string` | n/a | yes |
| <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name) | Nome do subdomínio personalizado | `string` | n/a | yes |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | Ação padrão das ACLs de rede | `string` | n/a | yes |
| <a name="input_dynamic_throttling_enabled"></a> [dynamic\_throttling\_enabled](#input\_dynamic\_throttling\_enabled) | Habilitar ou não o controle de taxa dinâmico | `bool` | `false` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Lista de IDs de identidade atribuída | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Tipo de identidade atribuída | `string` | n/a | yes |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | Lista de regras de IP permitidos | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Localização do recurso | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do Resource Group | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU do recurso Content Safety | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_content_safety_endpoint"></a> [content\_safety\_endpoint](#output\_content\_safety\_endpoint) | Endpoint do recurso de content\_safety |
| <a name="output_content_safety_id"></a> [content\_safety\_id](#output\_content\_safety\_id) | Id do recurso de content\_safety |
| <a name="output_content_safety_primary_access_key"></a> [content\_safety\_primary\_access\_key](#output\_content\_safety\_primary\_access\_key) | Access key primária do recurso de content\_safety |
| <a name="output_content_safety_secondary_access_key"></a> [content\_safety\_secondary\_access\_key](#output\_content\_safety\_secondary\_access\_key) | Access key secundária do recurso de content\_safety |
<!-- END_TF_DOCS -->