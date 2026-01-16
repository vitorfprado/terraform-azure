output "content_safety_id" {
  description = "Id do recurso de content_safety"
  value       = azurerm_cognitive_account.content_safety.id
}
output "content_safety_endpoint" {
  description = "Endpoint do recurso de content_safety"
  value       = azurerm_cognitive_account.content_safety.endpoint
}
output "content_safety_primary_access_key" {
  description = "Access key primária do recurso de content_safety"
  value       = azurerm_cognitive_account.content_safety.primary_access_key
}
output "content_safety_secondary_access_key" {
  description = "Access key secundária do recurso de content_safety"
  value       = azurerm_cognitive_account.content_safety.secondary_access_key
}