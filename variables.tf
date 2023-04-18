variable "create_pgsql_server" {
  type        = bool
  description = "Do you want to create Postgresql flexible server "
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
}

variable "administrator_login" {
  type        = string
  description = "(Required) The Administrator login for the PostgreSQL Flexible Server. Required when create_mode is Default and authentication.password_auth_enabled is true."
}

variable "administrator_password" {
  type        = string
  description = "(Required) The Password associated with the administrator_login for the PostgreSQL Flexible Server. Required when create_mode is Default and authentication.password_auth_enabled is true."
}

variable "authentication" {
  type        = any
  description = "(Optional) An authentication block"
  default     = []
}

variable "backup_retention_days" {
  type        = number
  description = "(Optional) The backup retention days for the PostgreSQL Flexible Server. Possible values are between 7 and 35 days."
  default     = 35
}

variable "customer_managed_key" {
  type        = any
  description = "(Optional) A customer_managed_key block, Changing this forces a new resource to be created."
  default     = []
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "(Optional) Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = false
}

variable "create_mode" {
  type        = string
  description = " (Optional) The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, Replica and Update. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = "Default"
}

variable "delegated_subnet_id" {
  type        = string
  description = "Optional) The ID of the virtual network subnet to create the PostgreSQL Flexible Server. The provided subnet should not have any other resource deployed in it and this subnet will be delegated to the PostgreSQL Flexible Server, if not already delegated. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = null
}

variable "private_dns_zone_id" {
  type        = string
  description = "(Optional) The ID of the private DNS zone to create the PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = null
}

variable "high_availability" {
  type        = any
  description = "(Optional) A high_availability block "
  default     = []
}

variable "identity" {
  type        = any
  description = "(Optional) An identity block"
  default     = []
}

variable "maintenance_window" {
  type        = any
  description = "(Optional) A maintenance_window block"
  default     = []
}

variable "point_in_time_restore_time_in_utc" {
  type        = string
  description = "(Optional) The point in time to restore from source_server_id when create_mode is PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = null
}

/* variable "replication_role" {
  type        = string
  description = "Optional) The replication role for the PostgreSQL Flexible Server. Possible value is None."
  default     = none
} */

variable "sku_name" {
  type        = string
  description = "(Optional) The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3)."
  default     = "B_Standard_B1ms"
}

variable "source_server_id" {
  type        = string
  description = "(Optional) The resource ID of the source PostgreSQL Flexible Server to be restored. Required when create_mode is PointInTimeRestore or Replica. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = null
}

variable "storage_mb" {
  type        = number
  description = "(Optional) The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, and 16777216."
  default     = 65536
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the PostgreSQL Flexible Server."
  default     = {}
}

variable "pg_version" {
  type        = number
  description = "(Optional) The version of PostgreSQL Flexible Server to use. Possible values are 11,12, 13 and 14. Required when create_mode is Default. Changing this forces a new PostgreSQL Flexible Server to be created."
  default     = 14
}
variable "zone" {
  type        = string
  description = "(Optional) Specifies the Availability Zone in which the PostgreSQL Flexible Server should be located."
  default     = null
}

### azurerm_postgresql_flexible_server_databases

variable "databases" {
  type        = any
  description = "(Optional) Databases you want to provision in the Server"
  default     = {}
}


variable "server_id" {
  type        = string
  description = "(Optional)The ID of the Azure PostgreSQL Flexible Server from which to create this PostgreSQL Flexible Server Database. Changing this forces a new Azure PostgreSQL Flexible Server Database to be created."
  default     = null
}

### azurerm_postgresql_flexible_server_configuration

variable "postgresql_configurations" {
  type        = any
  description = "(Optional) Sets a PostgreSQL Configuration value on a Azure PostgreSQL Flexible Server."
  default     = {}
}

variable "postgresql_fw_rules" {
  type        = any
  description = "(Optional) PostgreSQL Flexible Server Firewall Rule"
  default     = {}
}

### AD integration

variable "ad_logins" {
  type        = list(string)
  description = "(Optional) The login names of the principal to set as the server administrator"
  default     = []
}

