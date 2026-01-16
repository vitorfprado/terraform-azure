<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_function_app.function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_service_plan.asp_function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_windows_function_app.function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app) | resource |
| [null_resource.disable_scm_basic_auth](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_ftp"></a> [allow\_ftp](#input\_allow\_ftp) | Permitir ou não o FTP | `string` | `"FtpsOnly"` | no |
| <a name="input_allowed_origins"></a> [allowed\_origins](#input\_allowed\_origins) | Lista de origens permitidas para CORS | `list(string)` | `[]` | no |
| <a name="input_app_settings_variables"></a> [app\_settings\_variables](#input\_app\_settings\_variables) | Variáveis de ambiente do aplicativo | `map(string)` | `{}` | no |
| <a name="input_application_insights_connection_string"></a> [application\_insights\_connection\_string](#input\_application\_insights\_connection\_string) | String de conexão do Application Insights | `string` | `null` | no |
| <a name="input_asp_kind"></a> [asp\_kind](#input\_asp\_kind) | Tipo do Sistema Operacional do ASP. Ex: FunctionApp, Windows, Linux | `string` | n/a | yes |
| <a name="input_asp_name"></a> [asp\_name](#input\_asp\_name) | Nome do asp | `string` | n/a | yes |
| <a name="input_asp_size"></a> [asp\_size](#input\_asp\_size) | Plano do ASP da Function. Ex: Dynamic, ElasticPremium | `string` | n/a | yes |
| <a name="input_builtin_logging_enabled"></a> [builtin\_logging\_enabled](#input\_builtin\_logging\_enabled) | Habilitar ou não o log interno (builtin logging) | `bool` | `true` | no |
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | Habilitar ou não o uso de certificado de cliente | `string` | `"Optional"` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | Strings de conexão do aplicativo | <pre>list(object({<br/>    name  = string<br/>    type  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_elastic_instance_minimum"></a> [elastic\_instance\_minimum](#input\_elastic\_instance\_minimum) | Número de instancias para essa function | `number` | `1` | no |
| <a name="input_enable_appi"></a> [enable\_appi](#input\_enable\_appi) | Habilita ou desabilita váriavel do Application Insights | `bool` | n/a | yes |
| <a name="input_enable_cors"></a> [enable\_cors](#input\_enable\_cors) | Define se o CORS será configurado | `bool` | `false` | no |
| <a name="input_enable_scm"></a> [enable\_scm](#input\_enable\_scm) | Permitir ou não a autenticação básica para o Kudu/SCM endpoint | `bool` | `true` | no |
| <a name="input_enable_sticky_settings"></a> [enable\_sticky\_settings](#input\_enable\_sticky\_settings) | Define se as configurações sticky devem ser criadas | `bool` | `false` | no |
| <a name="input_ftp_publish_basic_authentication_enabled"></a> [ftp\_publish\_basic\_authentication\_enabled](#input\_ftp\_publish\_basic\_authentication\_enabled) | Habilitar ou não autenticação básica para publicação via FTP | `bool` | `false` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Nome da function | `string` | n/a | yes |
| <a name="input_function_os"></a> [function\_os](#input\_function\_os) | Tipo de sistema operacional a ser utilizado pela function, Ex: linux e windows. | `any` | n/a | yes |
| <a name="input_function_version"></a> [function\_version](#input\_function\_version) | Versão da Function. Ex: ~4 | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Região onde o recurso ficará alocado. Ex: southbrazil | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do Resource Group | `string` | n/a | yes |
| <a name="input_runtime_stack"></a> [runtime\_stack](#input\_runtime\_stack) | Stack na qual a function será executada | `string` | n/a | yes |
| <a name="input_stack_version"></a> [stack\_version](#input\_stack\_version) | Versão da stack da function | `string` | n/a | yes |
| <a name="input_sticky_app_settings"></a> [sticky\_app\_settings](#input\_sticky\_app\_settings) | Lista de nomes de app settings que devem ser mantidos entre slots | `list(string)` | `[]` | no |
| <a name="input_sticky_connection_strings"></a> [sticky\_connection\_strings](#input\_sticky\_connection\_strings) | Lista de nomes de connection strings que devem ser mantidas entre slots | `list(string)` | `[]` | no |
| <a name="input_sto_account_access_key"></a> [sto\_account\_access\_key](#input\_sto\_account\_access\_key) | Access Key do Storage do qual a function depende | `string` | n/a | yes |
| <a name="input_sto_account_name"></a> [sto\_account\_name](#input\_sto\_account\_name) | Nome do storage do qual a function depende | `string` | n/a | yes |
| <a name="input_support_credentials"></a> [support\_credentials](#input\_support\_credentials) | Habilitar ou não suporte a credenciais em CORS | `bool` | `false` | no |
| <a name="input_use_32_bit_worker"></a> [use\_32\_bit\_worker](#input\_use\_32\_bit\_worker) | Definir a platarforma para 32 bits(true) ou 64 bits(false) | `bool` | `false` | no |
| <a name="input_use_dotnet_isolated_runtime"></a> [use\_dotnet\_isolated\_runtime](#input\_use\_dotnet\_isolated\_runtime) | Usar dotnet isolated runtime ou não | `bool` | `true` | no |
| <a name="input_webdeploy_publish_basic_authentication_enabled"></a> [webdeploy\_publish\_basic\_authentication\_enabled](#input\_webdeploy\_publish\_basic\_authentication\_enabled) | Habilitar ou não autenticação básica para WebDeploy | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_func_ip_output"></a> [func\_ip\_output](#output\_func\_ip\_output) | n/a |
| <a name="output_func_name"></a> [func\_name](#output\_func\_name) | n/a |
<!-- END_TF_DOCS -->

