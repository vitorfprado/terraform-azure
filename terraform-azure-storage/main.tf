resource "azurerm_storage_account" "sto_account" {
  name                            = var.sto_name
  resource_group_name             = var.rg_name
  location                        = var.location
  account_tier                    = var.sto_account_tier
  account_replication_type        = var.sto_account_replication
  account_kind                    = var.account_kind
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  default_to_oauth_authentication = var.default_to_oauth_authentication
  public_network_access_enabled   = var.public_network_access_enabled

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  lifecycle {
    ignore_changes = [
      network_rules, tags
    ]
  }


}

resource "azurerm_storage_container" "storage_containers" {
  for_each              = var.sto_containers
  name                  = each.key
  storage_account_name  = azurerm_storage_account.sto_account.name
  container_access_type = each.value
}

resource "azurerm_storage_queue" "storage_queues" {
  for_each             = var.sto_queues
  name                 = each.value
  storage_account_name = azurerm_storage_account.sto_account.name
}

resource "azurerm_storage_table" "storage_tables" {
  for_each             = var.sto_tables
  name                 = each.key
  storage_account_name = azurerm_storage_account.sto_account.name
}


