output "func_ip_output" {
  value = local.azfunction.possible_outbound_ip_addresses
}

output "func_name" {
  value = local.azfunction.name
}

