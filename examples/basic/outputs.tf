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

output "resource_group_id" {
  description = "The resource group ID to provision the watsonx assistant instance."
  value       = module.resource_group.resource_group_id
}

output "resource_group_name" {
  description = "The resource group name to provision the watsonx assistant instance."
  value       = module.resource_group.resource_group_name
}
