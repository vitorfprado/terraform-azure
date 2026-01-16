resource "azurerm_container_registry" "container_registry" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "cr${var.system}${var.environment}"
  sku                 = var.acr_sku
  admin_enabled = false
}
