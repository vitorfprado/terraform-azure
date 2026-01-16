terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

module "resource_group" {
  source          = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-resourcegroup?ref=v1.2.0"
  system          = "webapp-example"
  environment     = "homolog"
  location        = "BrazilSouth"
  tag_client      = "teste"
  tag_environment = "homolog"
  tag_project     = "webapp"
}

module "vnet_module" {
  source      = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-vnet?ref=v1.0.0"
  rg_name     = module.resource_group.resource_group_name
  system      = "vntexample"
  environment = "homolog"
  location    = "brazilsouth"
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
      delegation = {
        name         = "delegation"
        service_name = "Microsoft.Web/serverFarms"
        actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  ]
}

module "webapp_module" {
  source                            = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-webapp?ref=v1.3.0"
  rg_name                           = module.resource_group.resource_group_name
  system                            = "app-testeexample"
  environment                       = "homolo"
  location                          = "Brazilsouth"
  enable_asp                        = true
  asp_kind_os                       = "Linux"
  asp_size                          = "B1"
  enable_appi_webapp                = true
  appi_type                         = "web"
  enable_autoscale                  = true
  enable_diagnostics                = true
  enable_health_check_path          = true
  health_check_path                 = "/health"
  health_check_eviction_time_in_min = "2"
  enable_slot                       = false
  app_webapp_slot_name              = "exslot"
  app_settings_variables = {
    examplevar = "exvalue"
  }
  web_app_os       = "linux"
  app_command_line = "node -v"
  application_stack = {
    language = "node"
    version  = "20-lts"
  }
  enable_vnet_integration = true
  subnet_id               = module.vnet_module.subnet_id[0]
}


output "ipwebapp" {
  value = module.webapp_module.ip_output_list
}
