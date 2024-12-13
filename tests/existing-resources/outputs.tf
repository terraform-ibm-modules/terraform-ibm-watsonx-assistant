########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the existing watsonx Assistant instance"
  value       = module.watsonx_assistant.account_id
}

output "id" {
  description = "ID of the watsonx Assistant instance."
  value       = module.watsonx_assistant.id
}

output "crn" {
  description = "CRN of the existing watsonx Assistant instance"
  value       = module.watsonx_assistant.crn
}

output "name" {
  description = "Name of the existing watsonx Assistant instance"
  value       = module.watsonx_assistant.name
}

output "guid" {
  description = "GUID of the existing watsonx Assistant instance"
  value       = module.watsonx_assistant.guid
}

output "plan_id" {
  description = "Plan ID of the existing watsonx Assistant instance."
  value       = module.watsonx_assistant.plan_id
}

output "dashboard_url" {
  description = "Dashboard URL of the existing watsonx Assistant instance."
  value       = module.watsonx_assistant.dashboard_url
}
