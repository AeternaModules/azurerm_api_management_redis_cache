output "api_management_redis_caches_id" {
  description = "Map of id values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.id }
}
output "api_management_redis_caches_api_management_id" {
  description = "Map of api_management_id values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.api_management_id }
}
output "api_management_redis_caches_cache_location" {
  description = "Map of cache_location values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.cache_location }
}
output "api_management_redis_caches_connection_string" {
  description = "Map of connection_string values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.connection_string }
  sensitive   = true
}
output "api_management_redis_caches_description" {
  description = "Map of description values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.description }
}
output "api_management_redis_caches_name" {
  description = "Map of name values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.name }
}
output "api_management_redis_caches_redis_cache_id" {
  description = "Map of redis_cache_id values across all api_management_redis_caches, keyed the same as var.api_management_redis_caches"
  value       = { for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : k => v.redis_cache_id }
}

