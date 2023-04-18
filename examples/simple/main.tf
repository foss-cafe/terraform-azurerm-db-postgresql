module "pgsql" {
  source                 = "../.."
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = "East US "
  administrator_login    = "rajeev"
  administrator_password = "xxxxx"
  sku_name               = "B_Standard_B1ms"

}