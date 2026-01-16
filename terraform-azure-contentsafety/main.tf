resource "azurerm_cognitive_account" "content_safety" {
  name                       = var.content_safety_name
  resource_group_name        = var.rg_name
  location                   = var.location
  kind                       = "ContentSafety"
  sku_name                   = var.sku_name
  custom_subdomain_name      = var.custom_subdomain_name
  dynamic_throttling_enabled = var.dynamic_throttling_enabled
  network_acls {
    default_action = var.default_action
    ip_rules       = var.ip_rules
  }
  identity {
    identity_ids = var.identity_ids
    type         = var.identity_type
  }
  lifecycle {
    ignore_changes = [ tags ]
  }
}