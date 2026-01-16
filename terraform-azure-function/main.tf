resource "azurerm_service_plan" "asp_function" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = var.asp_kind
  sku_name            = var.asp_size
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_linux_function_app" "function" {
  count                       = var.function_os == "linux" ? 1 : 0
  name                        = var.function_name
  location                    = var.location
  resource_group_name         = var.rg_name
  service_plan_id             = azurerm_service_plan.asp_function.id
  storage_account_name        = var.sto_account_name
  storage_account_access_key  = var.sto_account_access_key
  app_settings                = var.app_settings_variables
  functions_extension_version = var.function_version
  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }


  site_config {
    dynamic "application_stack" {
      for_each = var.runtime_stack == "dotnet" ? [1] : []
      content {
        dotnet_version              = var.stack_version
        use_dotnet_isolated_runtime = var.use_dotnet_isolated_runtime
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "node" ? [1] : []
      content {
        node_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "java" ? [1] : []
      content {
        java_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "powershell" ? [1] : []
      content {
        powershell_core_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "python" ? [1] : []
      content {
        python_version = var.stack_version
      }
    }

    dynamic "cors" {
      for_each = var.enable_cors ? [1] : []
      content {
        allowed_origins     = var.allowed_origins
        support_credentials = var.support_credentials
      }
    }

    ftps_state                             = var.allow_ftp
    use_32_bit_worker                      = var.use_32_bit_worker
    application_insights_connection_string = var.enable_appi ? var.application_insights_connection_string : null
    elastic_instance_minimum               = var.elastic_instance_minimum
  }
  webdeploy_publish_basic_authentication_enabled = var.webdeploy_publish_basic_authentication_enabled
  ftp_publish_basic_authentication_enabled       = var.ftp_publish_basic_authentication_enabled
  builtin_logging_enabled                        = var.builtin_logging_enabled
  client_certificate_mode                        = var.client_certificate
  dynamic "sticky_settings" {
    for_each = var.enable_sticky_settings ? [1] : []
    content {
      app_setting_names       = var.sticky_app_settings
      connection_string_names = var.sticky_connection_strings
    }
  }
  https_only = true

  depends_on = [
    azurerm_service_plan.asp_function
  ]
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_windows_function_app" "function" {
  count                       = var.function_os == "windows" ? 1 : 0
  name                        = var.function_name
  location                    = var.location
  resource_group_name         = var.rg_name
  service_plan_id             = azurerm_service_plan.asp_function.id
  storage_account_name        = var.sto_account_name
  storage_account_access_key  = var.sto_account_access_key
  app_settings                = var.app_settings_variables
  functions_extension_version = var.function_version
  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }
  site_config {
    dynamic "application_stack" {
      for_each = var.runtime_stack == "dotnet" ? [1] : []
      content {
        dotnet_version              = var.stack_version
        use_dotnet_isolated_runtime = var.use_dotnet_isolated_runtime
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "node" ? [1] : []
      content {
        node_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "java" ? [1] : []
      content {
        java_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.runtime_stack == "powershell" ? [1] : []
      content {
        powershell_core_version = var.stack_version
      }
    }

    dynamic "cors" {
      for_each = var.enable_cors ? [1] : []
      content {
        allowed_origins     = var.allowed_origins
        support_credentials = var.support_credentials
      }
    }
    ftps_state                             = var.allow_ftp
    use_32_bit_worker                      = var.use_32_bit_worker
    application_insights_connection_string = var.enable_appi ? var.application_insights_connection_string : null
    elastic_instance_minimum               = var.elastic_instance_minimum
  }
  webdeploy_publish_basic_authentication_enabled = var.webdeploy_publish_basic_authentication_enabled
  ftp_publish_basic_authentication_enabled       = var.ftp_publish_basic_authentication_enabled
  builtin_logging_enabled                        = var.builtin_logging_enabled
  client_certificate_mode                        = var.client_certificate
  dynamic "sticky_settings" {
    for_each = var.enable_sticky_settings ? [1] : []
    content {
      app_setting_names       = var.sticky_app_settings
      connection_string_names = var.sticky_connection_strings
    }
  }
  https_only = true

  depends_on = [
    azurerm_service_plan.asp_function
  ]
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "null_resource" "disable_scm_basic_auth" {
  count = var.enable_scm ? 0 : 1
  provisioner "local-exec" {
    command = <<EOT
      powershell -Command "az resource update --resource-group ${var.rg_name} --namespace Microsoft.Web --resource-type basicPublishingCredentialsPolicies --parent sites/${var.function_name} --name scm --set properties.allow=false"
    EOT
  }
  depends_on = [local.azfunction]
}


locals {
  azfunction = var.function_os == "linux" ? azurerm_linux_function_app.function[0] : azurerm_windows_function_app.function[0]
}