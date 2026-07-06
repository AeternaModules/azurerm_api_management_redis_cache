output "api_management_redis_caches" {
  description = "All api_management_redis_cache resources"
  value       = azurerm_api_management_redis_cache.api_management_redis_caches
  sensitive   = true
}
output "api_management_redis_caches_api_management_id" {
  description = "List of api_management_id values across all api_management_redis_caches"
  value       = [for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : v.api_management_id]
}
output "api_management_redis_caches_cache_location" {
  description = "List of cache_location values across all api_management_redis_caches"
  value       = [for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : v.cache_location]
}
output "api_management_redis_caches_connection_string" {
  description = "List of connection_string values across all api_management_redis_caches"
  value       = [for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : v.connection_string]
  sensitive   = true
}
output "api_management_redis_caches_description" {
  description = "List of description values across all api_management_redis_caches"
  value       = [for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : v.description]
}
output "api_management_redis_caches_name" {
  description = "List of name values across all api_management_redis_caches"
  value       = [for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : v.name]
}
output "api_management_redis_caches_redis_cache_id" {
  description = "List of redis_cache_id values across all api_management_redis_caches"
  value       = [for k, v in azurerm_api_management_redis_cache.api_management_redis_caches : v.redis_cache_id]
}

