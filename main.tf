resource "azurerm_postgresql_flexible_server" "this" {
  count = var.create_pgsql_server ? 1 : 0

  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  dynamic "authentication" {
    for_each = var.authentication

    content {
      active_directory_auth_enabled = try(authentication.value.active_directory_auth_enabled, false)
      password_auth_enabled         = try(authentication.value.password_auth_enabled, true)
      tenant_id                     = try(authentication.value.tenant_id, null)
    }
  }

  backup_retention_days = var.backup_retention_days

  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key

    content {
      key_vault_key_id                  = try(customer_managed_key.value.key_vault_key_id, null)
      primary_user_assigned_identity_id = try(customer_managed_key.value.primary_user_assigned_identity_id, null)
    }
  }
  #checkov:skip=CKV2_AZURE_26
  #checkov:skip=CKV_AZURE_136
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  create_mode                  = var.create_mode
  delegated_subnet_id          = var.delegated_subnet_id
  private_dns_zone_id          = var.private_dns_zone_id

  dynamic "high_availability" {
    for_each = var.high_availability

    content {
      mode                      = try(high_availability.value.mode)
      standby_availability_zone = try(high_availability.value.standby_availability_zone, null)
    }
  }

  dynamic "identity" {
    for_each = var.identity

    content {
      type         = try(identity.value.type)
      identity_ids = try(identity.value.identity_ids, null)
    }

  }

  dynamic "maintenance_window" {
    for_each = var.maintenance_window

    content {
      day_of_week  = try(maintenance_window.value.day_of_week, 0)
      start_hour   = try(maintenance_window.value.start_hour, 0)
      start_minute = try(maintenance_window.value.start_minute, 0)
    }
  }

  point_in_time_restore_time_in_utc = var.point_in_time_restore_time_in_utc
  # replication_role                  = var.replication_role
  sku_name         = var.sku_name
  source_server_id = var.source_server_id
  storage_mb       = var.storage_mb
  version          = var.pg_version
  zone             = var.zone

  tags = var.tags

  lifecycle {
    precondition {
      condition     = var.private_dns_zone_id != null && var.delegated_subnet_id != null || var.private_dns_zone_id == null && var.delegated_subnet_id == null
      error_message = "There will be a breaking change from upstream service at 15th July 2021, the private_dns_zone_id will be required when setting a delegated_subnet_id. For existing flexible servers who don't want to be recreated, you need to provide the private_dns_zone_id to the service team to manually migrate to the specified private DNS zone. The azurerm_private_dns_zone should end with suffix .postgres.database.azure.com."
    }
  }
}

resource "azurerm_postgresql_flexible_server_database" "this" {
  for_each = var.databases

  name      = each.key
  server_id = var.create_pgsql_server ? azurerm_postgresql_flexible_server.this[0].id : var.server_id
  charset   = try(each.value.charset, "UTF8")
  collation = try(each.value.collation, "en_US.utf8")

}

resource "azurerm_postgresql_flexible_server_configuration" "this" {
  for_each = var.postgresql_configurations

  name      = each.key
  server_id = var.create_pgsql_server ? azurerm_postgresql_flexible_server.this[0].id : var.server_id
  value     = each.value
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "this" {
  for_each = var.postgresql_fw_rules

  name             = each.key
  server_id        = var.create_pgsql_server ? azurerm_postgresql_flexible_server.this[0].id : var.server_id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}
/* 
resource "azurerm_postgresql_flexible_server_active_directory_administrator" "this" {
  for_each = toset(var.ad_logins)

  server_name         = var.create_pgsql_server ? azurerm_postgresql_flexible_server.this[0].id : var.server_id
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  login               = each.key
} */
