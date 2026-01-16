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
  system          = "sistemax"
  environment     = "environment"
  tag_client      = "client"
  tag_project     = "project"
  tag_environment = "prod"
}

module "content_safety" {
  source                     = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-contentsafety?ref=v1.0.0"
  content_safety_name        = "cs-example"
  location                   = "EastUS2"
  rg_name                    = module.resource_group.resource_group_name
  sku_name                   = "F0"
  custom_subdomain_name      = "cs-example"
  dynamic_throttling_enabled = false
  default_action             = "Allow"
  ip_rules                   = []
  identity_ids               = []
  identity_type              = "SystemAssigned"
}