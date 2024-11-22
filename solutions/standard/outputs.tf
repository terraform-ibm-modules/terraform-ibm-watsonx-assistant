##############################################################################
# Outputs
##############################################################################

output "id" {
  description = "watsonx Assistant instance id"
  value       = module.watsonx_assistant.watsonx_assistant_id
}

output "guid" {
  description = "watsonx Assistant instance guid"
  value       = module.watsonx_assistant.watsonx_assistant_guid
}

output "crn" {
  description = "watsonx Assistant instance crn"
  value       = module.watsonx_assistant.watsonx_assistant_crn
}

output "name" {
  description = "watsonx Assistant instance name"
  value       = module.watsonx_assistant.watsonx_assistant_name
}

output "plan_id" {
  description = "watsonx Assistant instance plan ID"
  value       = module.watsonx_assistant.watsonx_assistant_plan_id
}

output "dashboard_url" {
  description = "watsonx Assistant instance dashboard URL"
  value       = module.watsonx_assistant.watsonx_assistant_dashboard_url
}
