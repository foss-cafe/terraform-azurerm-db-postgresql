resource "azurerm_private_dns_zone" "this" {
  name                = format("%s.private.postgres.database.azure.com", var.name)
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = format("%s_dns_zone_postgres", var.name)
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.resource_group_name

  depends_on = [
    azurerm_private_dns_zone.this
  ]
}


module "pgsql" {
  source                 = "../.."
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = "East US "
  administrator_login    = "rajeev"
  administrator_password = "xxxx"
  sku_name               = "B_Standard_B1ms"
  delegated_subnet_id    = var.delegated_subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.this.id

  depends_on = [
    azurerm_private_dns_zone.this
  ]
}