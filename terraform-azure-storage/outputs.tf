output "sto_account_connection_string" {
  value = azurerm_storage_account.sto_account.primary_connection_string
}

output "sto_account_name" {
  value = azurerm_storage_account.sto_account.name
}

output "sto_account_primary_access_key" {
  value = azurerm_storage_account.sto_account.primary_access_key
}

output "sto_blob_url" {
  value = azurerm_storage_account.sto_account.primary_blob_endpoint
}