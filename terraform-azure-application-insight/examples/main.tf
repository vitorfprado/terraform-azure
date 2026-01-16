terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

module "rg" {
  source      = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-resourcegroup"
  system      = "example"
  environment = "env"
  location    = "Brazilsouth"
}

module "application_insight" {
  source      = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-application-insight?ref=v1.1.0"
  system      = "ex-sys"
  environment = "ex-env"
  rg_name     = module.rg.resource_group_names
  location    = module.rg.resource_group_location
  type        = "web"
  resource    = "ex"
  retention_in_days = 30  #default = 30
}