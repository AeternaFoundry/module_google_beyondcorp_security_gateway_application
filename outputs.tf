output "beyondcorp_security_gateway_applications_id" {
  description = "Map of id values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no id are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.id if v.id != null && length(v.id) > 0 }
}
output "beyondcorp_security_gateway_applications_application_id" {
  description = "Map of application_id values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no application_id are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.application_id if v.application_id != null && length(v.application_id) > 0 }
}
output "beyondcorp_security_gateway_applications_create_time" {
  description = "Map of create_time values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no create_time are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "beyondcorp_security_gateway_applications_deletion_policy" {
  description = "Map of deletion_policy values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no deletion_policy are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "beyondcorp_security_gateway_applications_display_name" {
  description = "Map of display_name values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no display_name are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "beyondcorp_security_gateway_applications_endpoint_matchers" {
  description = "Map of endpoint_matchers values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no endpoint_matchers are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.endpoint_matchers if v.endpoint_matchers != null && length(v.endpoint_matchers) > 0 }
}
output "beyondcorp_security_gateway_applications_name" {
  description = "Map of name values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no name are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.name if v.name != null && length(v.name) > 0 }
}
output "beyondcorp_security_gateway_applications_project" {
  description = "Map of project values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no project are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.project if v.project != null && length(v.project) > 0 }
}
output "beyondcorp_security_gateway_applications_schema" {
  description = "Map of schema values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no schema are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.schema if v.schema != null && length(v.schema) > 0 }
}
output "beyondcorp_security_gateway_applications_security_gateway_id" {
  description = "Map of security_gateway_id values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no security_gateway_id are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.security_gateway_id if v.security_gateway_id != null && length(v.security_gateway_id) > 0 }
}
output "beyondcorp_security_gateway_applications_update_time" {
  description = "Map of update_time values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no update_time are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "beyondcorp_security_gateway_applications_upstreams" {
  description = "Map of upstreams values across all beyondcorp_security_gateway_applications, keyed the same as var.beyondcorp_security_gateway_applications except keys with no upstreams are omitted"
  value       = { for k, v in google_beyondcorp_security_gateway_application.beyondcorp_security_gateway_applications : k => v.upstreams if v.upstreams != null && length(v.upstreams) > 0 }
}

