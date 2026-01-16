<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.7.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.7.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Lista de servidores DNS para a VNet, ex: ["10.0.0.4", "10.0.0.5"] | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Nome do Ambiente Ex: prod, homolog | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Região onde os recursos ficaram localizados. Ex: brazilsouth | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Nome do Resource Group onde os recursos serão criados | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Configurações de sub-redes, ver a pasta examples para exemplo de uso | <pre>list(object({<br/>    name             = string<br/>    address_prefixes = list(string)<br/>    delegation = optional(object({<br/>      name         = string<br/>      service_name = string<br/>      actions      = optional(list(string))<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_system"></a> [system](#input\_system) | Nome do Sistema | `string` | n/a | yes |
| <a name="input_vnet_address"></a> [vnet\_address](#input\_vnet\_address) | Range de ip da vnet, ex: ["10.0.0.0/16"] | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_guid"></a> [guid](#output\_guid) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->