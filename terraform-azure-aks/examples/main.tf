terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

module "resource_group" {
  source      = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-resourcegroup?ref=v1.1.0"
  system      = "aks-cluster"
  environment = "homol"
  location    = "BrazilSouth"
}



module "aks_module" {
  source                      = "git::https://bnpdesenvolvimento@dev.azure.com/bnpdesenvolvimento/BNP/_git/terraform-azure-aks?ref=v1.4.0"
  rg_name                     = module.resource_group.resource_group_name
  location                    = module.resource_group.resource_group_location
  system                      = "cluster"
  environment                 = "standard"
  dns_prefix                  = "exdns"
  node_pool_name              = "defaultpool"
  node_amount                 = 1
  node_labels                 = { "env" = "prod", "type" = "backend" }
  enable_node_pool            = true
  node_tier                   = "Standard_D2ads_v6"
  node_pool_config = {
    pool1 = {
      node_tier   = "Standard_D2ads_v6"
      node_amount = 1
      node_labels = { "env" = "dev", "type" = "frontend" }
      enable_node_pool_auto_scale = false
    }
    pool2 = {
      node_tier   = "Standard_D2ads_v6"
      node_amount = 1
      node_labels = { "env" = "prod", "type" = "frontend" }
      enable_node_pool_auto_scale = true
      min_nodes_per_pool          = 1
      max_nodes_per_pool          = 3
    }
  }
  enable_csi                      = true
  enable_oidc                     = true
  enable_workload_identity        = true
  enable_azure_adrbac             = false
  azure_ad_admin_group_object_ids = []
  tenant_id                       = "seu-tenant-id"
  enable_azure_rbac               = true
}
