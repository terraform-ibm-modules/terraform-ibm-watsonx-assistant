########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the watsonx Assistant instance."
  value       = local.account_id
}

output "id" {
  description = "ID of the watsonx Assistant instance."
  value       = local.watsonx_assistant_id
}

output "crn" {
  description = "The CRN of the watsonx Assistant instance."
  value       = local.watsonx_assistant_crn
}

output "guid" {
  description = "The GUID of the watsonx Assistant instance."
  value       = local.watsonx_assistant_guid
}

output "name" {
  description = "The name of the watsonx Assistant instance."
  value       = local.watsonx_assistant_name
}

output "plan_id" {
  description = "The plan ID of the watsonx Assistant instance."
  value       = local.watsonx_assistant_plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the watsonx Assistant instance."
  value       = local.watsonx_assistant_dashboard_url
}
