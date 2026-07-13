variable "api_management_redis_caches" {
  description = <<EOT
Map of api_management_redis_caches, attributes below
Required:
    - api_management_id
    - connection_string
    - connection_string_key_vault_id (optional, alternative to connection_string)
    - connection_string_key_vault_secret_name (optional, alternative to connection_string)
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
    cache_location                          = optional(string)
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
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

