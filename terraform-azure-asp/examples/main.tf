terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

module "asp_module" {
  source = "./.."
  enable_rg = true
  system = "example"
  environment = "dev"
  location = "Brazilsouth"
  # rg_name = ""   definir apenas caso for utilizar outro grupo de recursos

  asp_kind_os = "Linux"
  asp_size = "S1"
  enable_autoscale = true
}