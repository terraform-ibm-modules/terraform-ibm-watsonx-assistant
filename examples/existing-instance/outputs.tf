########################################################################################################################
# Outputs
########################################################################################################################

output "resource_group_id" {
  description = "The resource group ID where watsonx assistant instance is provisioned."
  value       = data.ibm_resource_instance.existing_assistant_instance[0].resource_group_id
}

output "resource_group_name" {
  description = "The resource group name where watsonx assistant instance is provisioned."
  value       = data.ibm_resource_instance.existing_assistant_instance[0].resource_group_name
}

output "region" {
  description = "Region where the watsonx assistant instance is provisioned."
  value       = data.ibm_resource_instance.existing_assistant_instance[0].location
}

output "watsonx_assistant_name" {
  description = "The name of the watsonx Assistant instance"
  value       = data.ibm_resource_instance.existing_assistant_instance[0].name
}

output "watsonx_assistant_guid" {
  description = "GUID of the watsonx Assistant instance"
  value       = data.ibm_resource_instance.existing_assistant_instance[0].guid
}

output "watsonx_assistant_status" {
  description = "The status of watsonx assistant instance."
  value       = data.ibm_resource_instance.existing_assistant_instance[0].status
}
