########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the watsonx Assistant instance"
  value       = module.watsonx_assistant.account_id
}

output "crn" {
  description = "CRN of the watsonx Assistant instance"
  value       = module.watsonx_assistant.crn
}

output "guid" {
  description = "GUID of the watsonx Assistant instance"
  value       = module.watsonx_assistant.guid
}

output "name" {
  description = "Name of the watsonx Assistant instance"
  value       = module.watsonx_assistant.name
}

output "plan_id" {
  description = "Plan ID of the existing watsonx Assistant instance."
  value       = module.watsonx_assistant.plan_id
}

output "dashboard_url" {
  description = "Dashboard URL of the existing watsonx Assistant instance."
  value       = module.watsonx_assistant.dashboard_url
}

output "resource_group_id" {
  description = "The resource group ID to provision the watsonx assistant instance."
  value       = module.resource_group.resource_group_id
}

output "resource_group_name" {
  description = "The resource group name to provision the watsonx assistant instance."
  value       = module.resource_group.resource_group_name
}
