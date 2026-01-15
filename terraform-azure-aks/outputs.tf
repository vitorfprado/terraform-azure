output "aks_id" {
  value = azurerm_kubernetes_cluster.kubernete_cluster.id
}
output "node_pools" {
  value = [for pool in azurerm_kubernetes_cluster_node_pool.kubernete_node_pool : pool.name]
}