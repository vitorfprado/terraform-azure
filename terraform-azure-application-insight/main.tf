
resource "azurerm_log_analytics_workspace" "log_workspace_applicationinsight" {
  name                = "log-appi-${var.resource}-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  lifecycle {
    ignore_changes = [ tags ]
  }
}

resource "azurerm_application_insights" "application_insight" {
  name                = "appi-${var.resource}-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = var.type
  workspace_id        = azurerm_log_analytics_workspace.log_workspace_applicationinsight.id
  lifecycle {
    ignore_changes = [ tags ]
  }
}