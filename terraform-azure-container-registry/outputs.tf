output "acr_id" {
  description = "O Resource ID completo do Azure Container Registry."
  value       = azurerm_container_registry.container_registry.id 
}

output "acr_name" {
  description = "O nome único do Azure Container Registry."
  value       = azurerm_container_registry.container_registry.name
}