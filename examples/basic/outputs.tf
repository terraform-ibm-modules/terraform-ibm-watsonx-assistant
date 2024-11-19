########################################################################################################################
# Outputs
########################################################################################################################

output "watsonx_assistant_crn" {
  description = "CRN of the watsonx Assistant instance"
  value       = module.watsonx_assistant.watsonx_assistant_crn
}

output "watsonx_assistant_guid" {
  description = "GUID of the watsonx Assistant instance"
  value       = module.watsonx_assistant.watsonx_assistant_guid
}

output "watsonx_assistant_name" {
  description = "Name of the watsonx Assistant instance"
  value       = module.watsonx_assistant.watsonx_assistant_name
}

output "watsonx_assistant_plan_id" {
  description = "Plan ID of the watsonx Assistant instance"
  value       = module.watsonx_assistant.watsonx_assistant_plan_id
}

output "watsonx_assistant_dashboard_url" {
  description = "Dashboard URL of the watsonx Assistant instance"
  value       = module.watsonx_assistant.watsonx_assistant_dashboard_url
}
