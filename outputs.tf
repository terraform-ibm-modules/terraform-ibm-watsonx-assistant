########################################################################################################################
# Outputs
########################################################################################################################

output "watsonx_assistant_crn" {
  description = "The CRN of the watsonx Assistant instance."
  value       = local.assistant_crn
}

output "watsonx_assistant_guid" {
  description = "The GUID of the watsonx Assistant instance."
  value       = local.assistant_guid
}

output "watsonx_assistant_name" {
  description = "The name of the watsonx Assistant instance."
  value       = local.assistant_name
}

output "watsonx_assistant_plan_id" {
  description = "The plan ID of the watsonx Assistant instance."
  value       = local.assistant_plan_id
}

output "watsonx_assistant_dashboard_url" {
  description = "The dashboard URL of the watsonx Assistant instance."
  value       = local.assistant_dashboard_url
}
