
resource "azurerm_service_plan" "asp_webapp" {
  count               = var.enable_asp ? 1 : 0
  name                = "asp-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = var.asp_kind_os
  sku_name            = var.asp_size
}


resource "azurerm_monitor_autoscale_setting" "asp_autoscale" {
  count               = var.enable_autoscale ? 1 : 0
  name                = "autoscale-asp-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  target_resource_id  = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id
  enabled             = var.enable_autoscale

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
        metric_resource_id = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id
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
        metric_resource_id = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id
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
        metric_resource_id = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id
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
        metric_resource_id = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id
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



resource "azurerm_linux_web_app" "app_webapp" {
  count               = var.web_app_os == "linux" ? 1 : 0
  name                = "app-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id

  lifecycle {
    ignore_changes = [ 
      site_config[0].application_stack[0].docker_image_name
     ]
  }

  site_config {
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = var.docker_registry_url
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
    app_command_line                  = var.app_command_line
    always_on                         = false
    http2_enabled                     = false
    worker_count                      = 1
    minimum_tls_version               = "1.2"
    ftps_state                        = "FtpsOnly"
    health_check_path                 = var.enable_health_check_path ? var.health_check_path : null
    health_check_eviction_time_in_min = var.enable_health_check_path ? var.health_check_eviction_time_in_min : null

  }

  logs {
    http_logs {
      file_system {
        retention_in_days = var.logs_retention_in_days
        retention_in_mb   = 35
      }
    }
  }


  app_settings = merge(
    {
      "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
      "APPLICATIONINSIGHTS_CONNECTION_STRING"      = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
      "ApplicationInsightsAgent_EXTENSION_VERSION" = var.enable_appi_webapp ? "~3" : null
    },
    var.app_settings_variables
  )

  sticky_settings {
    app_setting_names = keys(merge(
      {
        "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
        "APPLICATIONINSIGHTS_CONNECTION_STRING"      = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
        "ApplicationInsightsAgent_EXTENSION_VERSION" = var.enable_appi_webapp ? "~3" : null
      },
      var.app_settings_variables
    ))

  }

  https_only                 = true
  client_affinity_enabled    = false
  client_certificate_enabled = false #correspondente à client_cert_enabled no azurerm_app_service
}

resource "azurerm_linux_web_app_slot" "app_webapp_slot" {

  count = var.enable_slot && var.web_app_os == "linux" ? 1 : 0

  name           = var.app_webapp_slot_name
  app_service_id = local.app_service.id

  site_config {
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = var.docker_registry_url
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
    always_on           = local.app_service.site_config[0].always_on
    http2_enabled       = local.app_service.site_config[0].http2_enabled
    worker_count        = local.app_service.site_config[0].worker_count
    minimum_tls_version = local.app_service.site_config[0].minimum_tls_version
    ftps_state          = local.app_service.site_config[0].ftps_state
  }

  app_settings = local.app_service.app_settings
}








resource "azurerm_windows_web_app" "app_webapp" {
  count               = var.web_app_os == "windows" ? 1 : 0
  name                = "app-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.enable_asp ? azurerm_service_plan.asp_webapp[0].id : var.asp_id

  lifecycle {
    ignore_changes = [ 
      site_config[0].application_stack[0].docker_image_name
     ]
  }

  site_config {
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = var.docker_registry_url
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
    always_on           = false
    http2_enabled       = false
    worker_count        = 1
    minimum_tls_version = "1.2"
    ftps_state          = "FtpsOnly"

  }

  logs {
    http_logs {
      file_system {
        retention_in_days = var.logs_retention_in_days
        retention_in_mb   = 35
      }
    }
  }


  app_settings = merge(
    {
      "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
      "APPLICATIONINSIGHTS_CONNECTION_STRING"      = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
      "ApplicationInsightsAgent_EXTENSION_VERSION" = var.enable_appi_webapp ? "~3" : null
    },
    var.app_settings_variables
  )

  sticky_settings {
    app_setting_names = keys(merge(
      {
        "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
        "APPLICATIONINSIGHTS_CONNECTION_STRING"      = var.enable_appi_webapp ? azurerm_application_insights.appi_webapp[0].connection_string : null,
        "ApplicationInsightsAgent_EXTENSION_VERSION" = var.enable_appi_webapp ? "~3" : null
      },
      var.app_settings_variables
    ))

  }

  https_only                 = true
  client_affinity_enabled    = false
  client_certificate_enabled = false
}

resource "azurerm_windows_web_app_slot" "app_webapp_slot" {

  count = var.enable_slot && var.web_app_os == "windows" ? 1 : 0

  name           = var.app_webapp_slot_name
  app_service_id = local.app_service.id
  site_config {
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = var.docker_registry_url
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
    always_on           = local.app_service.site_config[0].always_on
    http2_enabled       = local.app_service.site_config[0].http2_enabled
    worker_count        = local.app_service.site_config[0].worker_count
    minimum_tls_version = local.app_service.site_config[0].minimum_tls_version
    ftps_state          = local.app_service.site_config[0].ftps_state
  }

  app_settings = local.app_service.app_settings
}





locals {
  app_service = var.web_app_os == "windows" ? azurerm_windows_web_app.app_webapp[0] : azurerm_linux_web_app.app_webapp[0]
}





resource "azurerm_log_analytics_workspace" "log_workspace_diagnostics" {
  count               = var.enable_diagnostics ? 1 : 0
  name                = "log-app-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}


resource "azurerm_monitor_diagnostic_setting" "diagnostics_webapp" {
  count                      = var.enable_diagnostics ? 1 : 0
  name                       = "diag-${local.app_service.name}"
  target_resource_id         = local.app_service.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace_diagnostics[0].id

  enabled_log {
    category = "AppServiceConsoleLogs"
  }

  enabled_log {
    category = "AppServiceAppLogs"
  }

  enabled_log {
    category = "AppServicePlatformLogs"
  }

  metric {
    category = "AllMetrics"
    enabled  = false
  }

  depends_on = [azurerm_log_analytics_workspace.log_workspace_diagnostics]
}



resource "azurerm_log_analytics_workspace" "log_workspace_appi" {
  count               = var.enable_appi_webapp ? 1 : 0
  name                = "log-appi-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}



resource "azurerm_application_insights" "appi_webapp" {
  count               = var.enable_appi_webapp ? 1 : 0
  name                = "appi-${var.system}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = var.appi_type
  workspace_id        = var.enable_appi_webapp ? azurerm_log_analytics_workspace.log_workspace_appi[0].id : null
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  count          = var.enable_vnet_integration ? 1 : 0
  app_service_id = local.app_service.id
  subnet_id      = var.subnet_id
}


