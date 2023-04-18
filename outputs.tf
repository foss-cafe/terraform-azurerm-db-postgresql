output "id" {
  description = "The ID of the PostgreSQL Flexible Server."
  value       = try(azurerm_postgresql_flexible_server.this[0].id, "")
}
output "fqdn" {
  description = "The FQDN of the PostgreSQL Flexible Server."
  value       = try(azurerm_postgresql_flexible_server.this[0].fqdn, "")
}

output "public_network_access_enabled" {
  description = "Is public network access enabled?"
  value       = try(azurerm_postgresql_flexible_server.this[0].public_network_access_enabled, false)
}
