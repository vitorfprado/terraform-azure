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
| [azurerm_storage_account.sto_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.storage_containers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_queue.storage_queues](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_table.storage_tables](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Tipo de conta a ser utilizada | `string` | `"Storage"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | Permitir ou não que itens aninhados sejam públicos | `bool` | `true` | no |
| <a name="input_default_to_oauth_authentication"></a> [default\_to\_oauth\_authentication](#input\_default\_to\_oauth\_authentication) | Definir autenticação OAuth como padrão | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Localização onde o recurso será criado | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Permitir ou não o acesso público ao servidor | `string` | `"true"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do grupo de recursos a ser utilizado | `string` | n/a | yes |
| <a name="input_sto_account_replication"></a> [sto\_account\_replication](#input\_sto\_account\_replication) | Tipo de replicação do storage account, valor default = LRS | `string` | `"LRS"` | no |
| <a name="input_sto_account_tier"></a> [sto\_account\_tier](#input\_sto\_account\_tier) | Tier do storage account, valor default = Standard | `string` | `"Standard"` | no |
| <a name="input_sto_containers"></a> [sto\_containers](#input\_sto\_containers) | Mapa de string, onde serão definidos os containers, devem ser criados no padrão {nome-container = 'tipo-container'} | `map(string)` | `{}` | no |
| <a name="input_sto_name"></a> [sto\_name](#input\_sto\_name) | Nome do storage account | `string` | n/a | yes |
| <a name="input_sto_queues"></a> [sto\_queues](#input\_sto\_queues) | Mapa de string, onde serão definidas as queues, devem ser criadas no padrão {chave-qualquer = 'nome-queue'} | `map(string)` | `{}` | no |
| <a name="input_sto_tables"></a> [sto\_tables](#input\_sto\_tables) | Set de string, onde serão definidas as tabelas, devem ser criadas no padrão ['nome1', 'nome2'] | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sto_account_connection_string"></a> [sto\_account\_connection\_string](#output\_sto\_account\_connection\_string) | n/a |
| <a name="output_sto_account_name"></a> [sto\_account\_name](#output\_sto\_account\_name) | n/a |
| <a name="output_sto_account_primary_access_key"></a> [sto\_account\_primary\_access\_key](#output\_sto\_account\_primary\_access\_key) | n/a |
| <a name="output_sto_blob_url"></a> [sto\_blob\_url](#output\_sto\_blob\_url) | n/a |
<!-- END_TF_DOCS -->