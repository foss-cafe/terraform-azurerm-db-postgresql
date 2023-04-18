[![Static security analysis for Terraform](https://github.com/foss-cafe/terraform-azurerm-db-postgresql/actions/workflows/checkov.yml/badge.svg)](https://github.com/foss-cafe/terraform-azurerm-db-postgresql/actions/workflows/checkov.yml)
# Terraform module for Azure Postgresql

## How to use it as a module

```hcl

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_logins"></a> [ad\_logins](#input\_ad\_logins) | (Optional) The login names of the principal to set as the server administrator | `list(string)` | `[]` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | (Required) The Administrator login for the PostgreSQL Flexible Server. Required when create\_mode is Default and authentication.password\_auth\_enabled is true. | `string` | n/a | yes |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | (Required) The Password associated with the administrator\_login for the PostgreSQL Flexible Server. Required when create\_mode is Default and authentication.password\_auth\_enabled is true. | `string` | n/a | yes |
| <a name="input_authentication"></a> [authentication](#input\_authentication) | (Optional) An authentication block | `any` | `[]` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | (Optional) The backup retention days for the PostgreSQL Flexible Server. Possible values are between 7 and 35 days. | `number` | `35` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | (Optional) The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, Replica and Update. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | `"Default"` | no |
| <a name="input_create_pgsql_server"></a> [create\_pgsql\_server](#input\_create\_pgsql\_server) | Do you want to create Postgresql flexible server | `bool` | `true` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | (Optional) A customer\_managed\_key block, Changing this forces a new resource to be created. | `any` | `[]` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | (Optional) Databases you want to provision in the Server | `any` | `{}` | no |
| <a name="input_delegated_subnet_id"></a> [delegated\_subnet\_id](#input\_delegated\_subnet\_id) | Optional) The ID of the virtual network subnet to create the PostgreSQL Flexible Server. The provided subnet should not have any other resource deployed in it and this subnet will be delegated to the PostgreSQL Flexible Server, if not already delegated. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | `null` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | (Optional) Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created. | `bool` | `false` | no |
| <a name="input_high_availability"></a> [high\_availability](#input\_high\_availability) | (Optional) A high\_availability block | `any` | `[]` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block | `any` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | (Optional) A maintenance\_window block | `any` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_pg_version"></a> [pg\_version](#input\_pg\_version) | (Optional) The version of PostgreSQL Flexible Server to use. Possible values are 11,12, 13 and 14. Required when create\_mode is Default. Changing this forces a new PostgreSQL Flexible Server to be created. | `number` | `14` | no |
| <a name="input_point_in_time_restore_time_in_utc"></a> [point\_in\_time\_restore\_time\_in\_utc](#input\_point\_in\_time\_restore\_time\_in\_utc) | (Optional) The point in time to restore from source\_server\_id when create\_mode is PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | `null` | no |
| <a name="input_postgresql_configurations"></a> [postgresql\_configurations](#input\_postgresql\_configurations) | (Optional) Sets a PostgreSQL Configuration value on a Azure PostgreSQL Flexible Server. | `any` | `{}` | no |
| <a name="input_postgresql_fw_rules"></a> [postgresql\_fw\_rules](#input\_postgresql\_fw\_rules) | (Optional) PostgreSQL Flexible Server Firewall Rule | `any` | `{}` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | (Optional) The ID of the private DNS zone to create the PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | (Optional)The ID of the Azure PostgreSQL Flexible Server from which to create this PostgreSQL Flexible Server Database. Changing this forces a new Azure PostgreSQL Flexible Server Database to be created. | `string` | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Optional) The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3). | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_source_server_id"></a> [source\_server\_id](#input\_source\_server\_id) | (Optional) The resource ID of the source PostgreSQL Flexible Server to be restored. Required when create\_mode is PointInTimeRestore or Replica. Changing this forces a new PostgreSQL Flexible Server to be created. | `string` | `null` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | (Optional) The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, and 16777216. | `number` | `65536` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the PostgreSQL Flexible Server. | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | (Optional) Specifies the Availability Zone in which the PostgreSQL Flexible Server should be located. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the PostgreSQL Flexible Server. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the PostgreSQL Flexible Server. |
| <a name="output_public_network_access_enabled"></a> [public\_network\_access\_enabled](#output\_public\_network\_access\_enabled) | Is public network access enabled? |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
