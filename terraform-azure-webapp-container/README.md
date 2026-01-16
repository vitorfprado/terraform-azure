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
| [azurerm_app_service_virtual_network_swift_connection.vnet_integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_application_insights.appi_webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_linux_web_app.app_webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.app_webapp_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_log_analytics_workspace.log_workspace_appi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_log_analytics_workspace.log_workspace_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_autoscale_setting.asp_autoscale](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_monitor_diagnostic_setting.diagnostics_webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_service_plan.asp_webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_windows_web_app.app_webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app) | resource |
| [azurerm_windows_web_app_slot.app_webapp_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app_slot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_command_line"></a> [app\_command\_line](#input\_app\_command\_line) | Comando de inicialização do webapp, opcional | `string` | `null` | no |
| <a name="input_app_settings_variables"></a> [app\_settings\_variables](#input\_app\_settings\_variables) | Variáveis de ambiente do aplicativo | `map(string)` | `{}` | no |
| <a name="input_app_webapp_slot_name"></a> [app\_webapp\_slot\_name](#input\_app\_webapp\_slot\_name) | Nome do slot criado | `string` | `null` | no |
| <a name="input_appi_type"></a> [appi\_type](#input\_appi\_type) | Tipo do application insights | `string` | `null` | no |
| <a name="input_asp_id"></a> [asp\_id](#input\_asp\_id) | Id do asp, definir apenas caso o asp for criado utilizando outro módulo | `string` | `null` | no |
| <a name="input_asp_kind_os"></a> [asp\_kind\_os](#input\_asp\_kind\_os) | Sistema operacional do asp, definir apenas caso o asp for criado dentro deste módulo | `string` | `null` | no |
| <a name="input_asp_size"></a> [asp\_size](#input\_asp\_size) | Tier do asp, definir apenas caso o asp for criado dentro deste módulo | `string` | `null` | no |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | Nome da imagem | `string` | n/a | yes |
| <a name="input_docker_registry_password"></a> [docker\_registry\_password](#input\_docker\_registry\_password) | Senha para autenticação na imagem | `string` | `null` | no |
| <a name="input_docker_registry_url"></a> [docker\_registry\_url](#input\_docker\_registry\_url) | Url da imagem a ser usada no container | `string` | n/a | yes |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | Usuário para autenticação na imagem | `string` | `null` | no |
| <a name="input_enable_appi_webapp"></a> [enable\_appi\_webapp](#input\_enable\_appi\_webapp) | Habilitar ou não a criação do application insights | `bool` | n/a | yes |
| <a name="input_enable_asp"></a> [enable\_asp](#input\_enable\_asp) | Habilitar ou não a criação do ASP | `bool` | n/a | yes |
| <a name="input_enable_autoscale"></a> [enable\_autoscale](#input\_enable\_autoscale) | Habilitar ou não o autoscale | `bool` | n/a | yes |
| <a name="input_enable_diagnostics"></a> [enable\_diagnostics](#input\_enable\_diagnostics) | Habilitar ou não os diagnósticos | `bool` | n/a | yes |
| <a name="input_enable_health_check_path"></a> [enable\_health\_check\_path](#input\_enable\_health\_check\_path) | Habilitar ou não o health check path | `bool` | n/a | yes |
| <a name="input_enable_slot"></a> [enable\_slot](#input\_enable\_slot) | Habilitar ou não a criação de slots | `bool` | n/a | yes |
| <a name="input_enable_vnet_integration"></a> [enable\_vnet\_integration](#input\_enable\_vnet\_integration) | Habilitar a integração do webapp com a vnet | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Nome do ambiente | `string` | n/a | yes |
| <a name="input_health_check_eviction_time_in_min"></a> [health\_check\_eviction\_time\_in\_min](#input\_health\_check\_eviction\_time\_in\_min) | Tempo em minutos para que uma instância não saudável seja removida | `string` | `null` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Caminho para onde será enviado o health check | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Localização onde o recurso será provisionado | `string` | n/a | yes |
| <a name="input_logs_retention_in_days"></a> [logs\_retention\_in\_days](#input\_logs\_retention\_in\_days) | Retenção de logs em dias | `number` | `7` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do grupo de recursos, definir apenas caso for criá-lo utilizando outro módulo | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id da subnet a ser conectada | `string` | `null` | no |
| <a name="input_system"></a> [system](#input\_system) | Nome do sistema | `string` | n/a | yes |
| <a name="input_web_app_os"></a> [web\_app\_os](#input\_web\_app\_os) | Define se o recurso criado será um linux webapp ou windows webapp | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_output_list"></a> [ip\_output\_list](#output\_ip\_output\_list) | n/a |
<!-- END_TF_DOCS -->