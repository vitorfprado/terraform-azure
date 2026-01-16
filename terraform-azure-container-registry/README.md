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
| [azurerm_container_registry.container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_sku"></a> [acr\_sku](#input\_acr\_sku) | Tier do ACR (Basic, Standard, Premium) | `string` | `"Standard"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Nome do ambiente | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Localização do recurso | `string` | `"BrazilSouth"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do grupo de recursos | `string` | n/a | yes |
| <a name="input_system"></a> [system](#input\_system) | Nome do sistema | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | O Resource ID completo do Azure Container Registry. |
| <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name) | O nome único do Azure Container Registry. |
<!-- END_TF_DOCS -->