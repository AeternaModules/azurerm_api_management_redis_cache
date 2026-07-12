variable "api_management_redis_caches" {
  description = <<EOT
Map of api_management_redis_caches, attributes below
Required:
    - api_management_id
    - connection_string
    - connection_string_key_vault_id (alternative to connection_string - read from Key Vault instead)
    - connection_string_key_vault_secret_name (alternative to connection_string - read from Key Vault instead)
    - name
Optional:
    - cache_location
    - description
    - redis_cache_id
EOT

  type = map(object({
    api_management_id                       = string
    connection_string                       = string
    connection_string_key_vault_id          = optional(string)
    connection_string_key_vault_secret_name = optional(string)
    name                                    = string
    cache_location                          = optional(string) # Default: "default"
    description                             = optional(string)
    redis_cache_id                          = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_redis_caches : (
        length(v.connection_string) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_redis_caches : (
        v.description == null || (length(v.description) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_redis_cache's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ApiManagementChildName] !matched
  # path: api_management_id
  #   source:    [from apimanagementservice.ValidateServiceID] !ok
  # path: api_management_id
  #   source:    [from apimanagementservice.ValidateServiceID] err != nil
  # path: redis_cache_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: redis_cache_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: cache_location
  #   source:    [from validate.RedisCacheLocation] !ok
}

