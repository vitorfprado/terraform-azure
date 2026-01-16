terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}


module "resource_group" {
  source          = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-resourcegroup?ref=v1.2.1"
  system          = "vnet-example"
  environment     = "homol"
  location        = "BrazilSouth"
  tag_client      = "ex"
  tag_environment = "homolog"
  tag_project     = "exteste"
}

module "vnet_module" {
  source      = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-vnet?ref=v1.1.0"
  rg_name     = module.resource_group.resource_group_name
  system      = "vntexample"
  environment = "homolog"
  location    = "brazilsouth"
  vnet_address = ["10.0.0.0/16"]
  dns_servers  = ["10.0.0.4", "10.0.0.5"]  # Opcional
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
      delegation = {
        name         = "delegation"
        service_name = "Microsoft.Web/serverFarms"
        actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    },
    {
      name             = "subnet2"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]
}