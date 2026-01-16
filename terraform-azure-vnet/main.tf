resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address
  dns_servers         = var.dns_servers != null ? var.dns_servers : []

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes

      dynamic "delegation" {
        for_each = subnet.value.delegation != null ? [subnet.value.delegation] : []
        content {
          name = delegation.value.name

          service_delegation {
            name    = delegation.value.service_name
            actions = try(delegation.value.actions, [])
          }
        }
      }
    }
  }
}