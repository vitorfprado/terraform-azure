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
| [azurerm_monitor_autoscale_setting.asp_autoscale](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_service_plan.asp_webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asp_kind_os"></a> [asp\_kind\_os](#input\_asp\_kind\_os) | Sistema operacional utilizado no ASP, Linux ou Windows | `string` | n/a | yes |
| <a name="input_asp_size"></a> [asp\_size](#input\_asp\_size) | Tier do ASP: S1, B1... | `string` | n/a | yes |
| <a name="input_enable_autoscale"></a> [enable\_autoscale](#input\_enable\_autoscale) | Habilitar ou não o auto-scale | `bool` | n/a | yes |
| <a name="input_enable_rg"></a> [enable\_rg](#input\_enable\_rg) | Habilitar ou não a criação do grupo de recursos utilizando este módulo | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Nome do ambiente | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Localização onde o recurso será provisionado | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do grupo de recursos, definir apenas caso for criá-lo utilizando outro módulo | `string` | `null` | no |
| <a name="input_system"></a> [system](#input\_system) | Nome do sistema | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asp_id"></a> [asp\_id](#output\_asp\_id) | Valor do identificador do asp |
<!-- END_TF_DOCS -->