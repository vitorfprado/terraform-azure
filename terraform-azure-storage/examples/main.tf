terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.7.0"
    }
  }
}

module "rg" {
  source          = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-resourcegroup?ref=v1.2.0"
  system          = "example-storage-acc"
  environment     = "dev"
  location        = "Brazilsouth"
  tag_client      = "cliente"
  tag_project     = "projeto"
  tag_environment = "homolog"
}

module "storage_account" {
  source                          = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-storage?ref=v1.3.1"
  sto_name                        = "stoexampleteste"
  rg_name                         = module.rg.resource_group_name
  location                        = module.rg.resource_group_location
  sto_account_tier                = "Standard"
  sto_containers                  = { cont1 = "blob", cont2 = "blob" }
  sto_queues                      = { queue1 = "queue1v", queue2 = "queue2v" }
  sto_tables                      = ["table1", "table2"]
  sto_account_replication         = "LRS"
  account_kind                    = "StorageV2"
  allow_nested_items_to_be_public = true
  default_to_oauth_authentication = true
  public_network_access_enabled   = true
}