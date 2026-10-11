variable "beyondcorp_security_gateway_applications" {
  description = <<EOT
Map of beyondcorp_security_gateway_applications, attributes below
Required:
    - application_id
    - security_gateway_id
Optional:
    - deletion_policy
    - display_name
    - project
    - schema
    - endpoint_matchers (block):
        - hostname (required)
        - ports (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - upstreams (block):
        - egress_policy (optional, block):
            - regions (required)
        - external (optional, block):
            - endpoints (required, block):
                - hostname (required)
                - port (required)
        - network (optional, block):
            - name (required)
        - proxy_protocol (optional, block):
            - allowed_client_headers (optional)
            - client_ip (optional)
            - contextual_headers (optional, block):
                - device_info (optional, block):
                    - output_type (optional)
                - group_info (optional, block):
                    - output_type (optional)
                - output_type (optional)
                - user_info (optional, block):
                    - output_type (optional)
            - gateway_identity (optional)
            - metadata_headers (optional)
EOT

  type = map(object({
    application_id      = string
    security_gateway_id = string
    deletion_policy     = optional(string)
    display_name        = optional(string)
    project             = optional(string)
    schema              = optional(string)
    endpoint_matchers = optional(list(object({
      hostname = string
      ports    = list(number)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    upstreams = optional(list(object({
      egress_policy = optional(object({
        regions = list(string)
      }))
      external = optional(object({
        endpoints = list(object({
          hostname = string
          port     = number
        }))
      }))
      network = optional(object({
        name = string
      }))
      proxy_protocol = optional(object({
        allowed_client_headers = optional(list(string))
        client_ip              = optional(bool)
        contextual_headers = optional(object({
          device_info = optional(object({
            output_type = optional(string)
          }))
          group_info = optional(object({
            output_type = optional(string)
          }))
          output_type = optional(string)
          user_info = optional(object({
            output_type = optional(string)
          }))
        }))
        gateway_identity = optional(string)
        metadata_headers = optional(map(string))
      }))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.beyondcorp_security_gateway_applications : (
        v.upstreams == null || alltrue([for item in v.upstreams : (item.external == null || (length(item.external.endpoints) >= 1))])
      )
    ])
    error_message = "Each endpoints list must contain at least 1 items"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

