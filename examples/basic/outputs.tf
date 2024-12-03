########################################################################################################################
# Outputs
########################################################################################################################

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

output "resource_group_id" {
  description = "The resource group ID to provision the watsonx assistant instance."
  value       = module.resource_group.resource_group_id
}

output "resource_group_name" {
  description = "The resource group name to provision the watsonx assistant instance."
  value       = module.resource_group.resource_group_name
}
