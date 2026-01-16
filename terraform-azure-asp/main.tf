resource "azurerm_resource_group" "resource_group" {
  count = var.enable_rg ? 1 : 0
  name     = "rg-${var.system}-${var.environment}"
  location = var.location
}



resource "azurerm_service_plan" "asp_webapp" {
  name                = "asp-${var.system}-${var.environment}"
  location            = var.enable_rg ? azurerm_resource_group.resource_group[0].location : var.location
  resource_group_name = var.enable_rg ? azurerm_resource_group.resource_group[0].name : var.rg_name
  os_type             = var.asp_kind_os
  sku_name            = var.asp_size
}

resource "azurerm_monitor_autoscale_setting" "asp_autoscale" {
  count                = var.enable_autoscale ? 1 : 0
  name                 = "autoscale-asp-${var.system}-${var.environment}"
  location            = var.enable_rg ? azurerm_resource_group.resource_group[0].location : var.location
  resource_group_name = var.enable_rg ? azurerm_resource_group.resource_group[0].name : var.rg_name
  target_resource_id   = azurerm_service_plan.asp_webapp.id
  enabled              = var.enable_autoscale

  profile {
    name = "default-autoscale-profile"
    capacity {
      default = 1
      minimum = 1
      maximum = 5
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_service_plan.asp_webapp.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 90
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_service_plan.asp_webapp.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT10M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 30
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "MemoryPercentage"
        metric_resource_id = azurerm_service_plan.asp_webapp.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 90
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "MemoryPercentage"
        metric_resource_id = azurerm_service_plan.asp_webapp.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT10M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 30
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }
}
