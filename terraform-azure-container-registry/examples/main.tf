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
  system          = "accountability-ia"
  environment     = "homolog"
  location        = "BrazilSouth"
  tag_client      = "sec"
  tag_environment = "homolog"
  tag_project     = "accountability-ia"
}

module "azure_container_registry" {
  source          = "../" 
  rg_name         = module.resource_group.resource_group_name
  location        = "BrazilSouth"
  system          = "accountabilityia"
  environment     = "homolog"
  acr_sku         = "Standard"
}
