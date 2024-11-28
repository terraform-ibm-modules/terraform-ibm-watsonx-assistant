########################################################################################################################
# Outputs
########################################################################################################################

output "watsonx_assistant_name" {
  description = "The name of the watsonx Assistant instance"
  value       = module.existing_watsonx_assistant_instance.watsonx_assistant_name
}

output "watsonx_assistant_guid" {
  description = "GUID of the watsonx Assistant instance"
  value       = module.existing_watsonx_assistant_instance.watsonx_assistant_guid
}
