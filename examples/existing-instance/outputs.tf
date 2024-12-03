########################################################################################################################
# Outputs
########################################################################################################################

output "name" {
  description = "The name of the watsonx Assistant instance"
  value       = module.existing_watsonx_assistant_instance.name
}

output "guid" {
  description = "GUID of the watsonx Assistant instance"
  value       = module.existing_watsonx_assistant_instance.guid
}
