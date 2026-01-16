output "appi_connection_string" {
  value = azurerm_application_insights.application_insight.connection_string
}

output "appi_instrumentation_key" {
  value = azurerm_application_insights.application_insight.instrumentation_key
}