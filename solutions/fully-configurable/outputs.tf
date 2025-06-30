##############################################################################
# Outputs
##############################################################################

output "account_id" {
  description = "Account ID of the watsonx Assistant instance."
  value       = module.watsonx_assistant.account_id
}

output "id" {
  description = "ID of the watsonx Assistant instance."
  value       = module.watsonx_assistant.id
}

output "crn" {
  description = "The CRN of the watsonx Assistant instance."
  value       = module.watsonx_assistant.crn
}

output "guid" {
  description = "The GUID of the watsonx Assistant instance."
  value       = module.watsonx_assistant.guid
}

output "name" {
  description = "The name of the watsonx Assistant instance."
  value       = module.watsonx_assistant.name
}

output "plan_id" {
  description = "The plan ID of the watsonx Assistant instance."
  value       = module.watsonx_assistant.plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the watsonx Assistant instance."
  value       = module.watsonx_assistant.dashboard_url
}
