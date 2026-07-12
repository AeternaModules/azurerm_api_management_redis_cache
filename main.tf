data "azurerm_key_vault_secret" "connection_string" {
  for_each     = { for k, v in var.api_management_redis_caches : k => v if v.connection_string_key_vault_id != null && v.connection_string_key_vault_secret_name != null }
  name         = each.value.connection_string_key_vault_secret_name
  key_vault_id = each.value.connection_string_key_vault_id
}
resource "azurerm_api_management_redis_cache" "api_management_redis_caches" {
  for_each = var.api_management_redis_caches

  api_management_id = each.value.api_management_id
  connection_string = each.value.connection_string != null ? each.value.connection_string : try(data.azurerm_key_vault_secret.connection_string[each.key].value, null)
  name              = each.value.name
  cache_location    = each.value.cache_location
  description       = each.value.description
  redis_cache_id    = each.value.redis_cache_id
}

