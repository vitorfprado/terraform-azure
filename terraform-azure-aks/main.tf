resource "azurerm_kubernetes_cluster" "kubernete_cluster" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "aks-${var.system}-${var.environment}"
  dns_prefix          = var.dns_prefix
  sku_tier            = var.cluster_sku
  default_node_pool {
    name        = var.node_pool_name
    node_count  = var.node_amount
    vm_size     = var.node_tier
    node_labels = var.node_labels
  }
  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled       = var.enable_oidc
  workload_identity_enabled = var.enable_workload_identity

  key_vault_secrets_provider {
    secret_rotation_enabled  = var.enable_csi
    secret_rotation_interval = var.csi_rotation
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.enable_azure_adrbac ? [1] : []
    content {
      admin_group_object_ids = var.azure_ad_admin_group_object_ids
      tenant_id              = var.tenant_id
      azure_rbac_enabled     = var.enable_azure_rbac
    }
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "kubernete_node_pool" {
  for_each              = var.enable_node_pool ? var.node_pool_config : {}
  kubernetes_cluster_id = azurerm_kubernetes_cluster.kubernete_cluster.id
  name                  = each.key
  vm_size               = each.value.node_tier
  node_count            = each.value.node_amount
  node_labels           = each.value.node_labels
  auto_scaling_enabled  = each.value.enable_node_pool_auto_scale
  min_count             = each.value.min_nodes_per_pool
  max_count             = each.value.max_nodes_per_pool
  upgrade_settings {
    drain_timeout_in_minutes      = 0
    max_surge                     = "10%"
    node_soak_duration_in_minutes = 0
  }
}

