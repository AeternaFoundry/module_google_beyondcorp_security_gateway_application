resource "google_beyondcorp_security_gateway_application" "beyondcorp_security_gateway_applications" {
  for_each = var.beyondcorp_security_gateway_applications

  application_id      = each.value.application_id
  security_gateway_id = each.value.security_gateway_id
  deletion_policy     = each.value.deletion_policy
  display_name        = each.value.display_name
  project             = each.value.project
  schema              = each.value.schema

  dynamic "endpoint_matchers" {
    for_each = each.value.endpoint_matchers != null ? each.value.endpoint_matchers : []
    content {
      hostname = endpoint_matchers.value.hostname
      ports    = endpoint_matchers.value.ports
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "upstreams" {
    for_each = each.value.upstreams != null ? each.value.upstreams : []
    content {
      dynamic "egress_policy" {
        for_each = upstreams.value.egress_policy != null ? [upstreams.value.egress_policy] : []
        content {
          regions = egress_policy.value.regions
        }
      }
      dynamic "external" {
        for_each = upstreams.value.external != null ? [upstreams.value.external] : []
        content {
          dynamic "endpoints" {
            for_each = external.value.endpoints
            content {
              hostname = endpoints.value.hostname
              port     = endpoints.value.port
            }
          }
        }
      }
      dynamic "network" {
        for_each = upstreams.value.network != null ? [upstreams.value.network] : []
        content {
          name = network.value.name
        }
      }
      dynamic "proxy_protocol" {
        for_each = upstreams.value.proxy_protocol != null ? [upstreams.value.proxy_protocol] : []
        content {
          allowed_client_headers = proxy_protocol.value.allowed_client_headers
          client_ip              = proxy_protocol.value.client_ip
          dynamic "contextual_headers" {
            for_each = proxy_protocol.value.contextual_headers != null ? [proxy_protocol.value.contextual_headers] : []
            content {
              dynamic "device_info" {
                for_each = contextual_headers.value.device_info != null ? [contextual_headers.value.device_info] : []
                content {
                  output_type = device_info.value.output_type
                }
              }
              dynamic "group_info" {
                for_each = contextual_headers.value.group_info != null ? [contextual_headers.value.group_info] : []
                content {
                  output_type = group_info.value.output_type
                }
              }
              output_type = contextual_headers.value.output_type
              dynamic "user_info" {
                for_each = contextual_headers.value.user_info != null ? [contextual_headers.value.user_info] : []
                content {
                  output_type = user_info.value.output_type
                }
              }
            }
          }
          gateway_identity = proxy_protocol.value.gateway_identity
          metadata_headers = proxy_protocol.value.metadata_headers
        }
      }
    }
  }
}

