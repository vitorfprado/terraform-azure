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

module "azure_disk" {
  source               = "git::https://dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-azuredisk?ref=v1.0.0"
  name                 = "grafana-disk"
  location             = module.resource_group_module.location
  resource_group_name  = module.resource_group_module.resource_group_name
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 128
}
