output "id" {
  value = azurerm_virtual_network.vnet.id
}
output "guid" {
  value = azurerm_virtual_network.vnet.guid
}
output "name" {
  value = azurerm_virtual_network.vnet.name
}
output "subnet_id" {
  value = [for s in azurerm_virtual_network.vnet.subnet : s.id]
}