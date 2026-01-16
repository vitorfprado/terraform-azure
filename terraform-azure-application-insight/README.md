<!-- BEGIN_TF_DOCS -->
## Requirements

- Grupo de recursoss

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.application_insight](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_log_analytics_workspace.log_workspace_applicationinsight](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Nome do ambiente do recurso | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Localização do recurso | `string` | n/a | yes |
| <a name="input_resource"></a> [resource](#input\_resource) | Nome do application insight | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Valor para definir o número de dias de retenção | `number` | `30` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do grupo de recurso | `string` | n/a | yes |
| <a name="input_system"></a> [system](#input\_system) | Nome do sistema do recurso | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Tipo de application insight | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appi_connection_string"></a> [appi\_connection\_string](#output\_appi\_connection\_string) | n/a |
| <a name="output_appi_instrumentation_key"></a> [appi\_instrumentation\_key](#output\_appi\_instrumentation\_key) | n/a |
<!-- END_TF_DOCS -->