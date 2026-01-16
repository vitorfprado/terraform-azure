terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

module "resource_group_module" {
  source      = "git::https://dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-resourcegroup?ref=v1.0.0"
  system      = "rg-ex"
  environment = "dev"
  location    = "Brazilsouth"
}

module "storage_module" {
  source           = "git::https://dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-storage?ref=v1.0.0"
  rg_name          = module.resource_group_module.resource_group_name
  system           = "stgex"
  environment      = "dev"
  location         = module.resource_group_module.resource_group_location
  sto_account_tier = "Standard"
  sto_containers = {
    "conteinerteste" = "private"
  }
  sto_queues = {
    "exfila" = "private"
  }
  sto_account_replication = "LRS"
}

module "function_module" {
  source                                         = "https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-function?ref=v3.1.4"
  asp_name                                       = "example-asp"
  function_name                                  = "function-namex-example"
  location                                       = "EastUS"
  function_os                                    = "windows"
  rg_name                                        = module.resource_group_module.resource_group_name
  sto_account_access_key                         = module.storage_module.sto_account_primary_access_key
  sto_account_name                               = module.storage_module.sto_account_name
  asp_kind                                       = "Windows"
  asp_size                                       = "EP1"
  elastic_instance_minimum                       = 1 
  function_version                               = "~4"
  runtime_stack                                  = "dotnet"
  stack_version                                  = "v8.0"
  use_dotnet_isolated_runtime                    = true
  enable_cors                                    = true
  enable_sticky_settings                         = true
  allowed_origins                                = ["xxxxxxx"]
  support_credentials                            = false
  sticky_app_settings                            = ["BLOB_ACCOUNT_NAME"]
  sticky_connection_strings                      = ["MyDb"]
  enable_appi                                    = false
  application_insights_connection_string         = null
  webdeploy_publish_basic_authentication_enabled = false
  ftp_publish_basic_authentication_enabled       = true
  builtin_logging_enabled                        = true
  client_certificate                             = "Optional"
  app_settings_variables = {
    FUNCTIONS_EXTENSION_VERSION                = "~4"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    BLOB_ACCOUNT_KEY                           = module.storage_module.sto_account_primary_access_key
    BLOB_ACCOUNT_NAME                          = module.storage_module.sto_account_name
    BLOB_CONN_STRING                           = module.storage_module.sto_account_connection_string
    DB_URI                                     = ""
  }
  connection_strings = [
    {
      name  = "MyDb"
      type  = "SQLAzure"
      value = "Server=tcp:xyz.database.windows.net;Database=db;User Id=admin;Password=pass;"
    },
    {
      name  = "AnotherDb"
      type  = "Custom"
      value = "Some=Other;Connection=String;"
    }
  ]
}

