########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the existing watsonx Assistant instance."
  value       = module.existing_watsonx_assistant_instance.crn
}
output "name" {
  description = "Name of the existing watsonx Assistant instance"
  value       = module.existing_watsonx_assistant_instance.name
}

output "guid" {
  description = "GUID of the existing watsonx Assistant instance"
  value       = module.existing_watsonx_assistant_instance.guid
}

output "plan_id" {
  description = "Plan ID of the existing watsonx Assistant instance."
  value       = module.existing_watsonx_assistant_instance.plan_id
}

output "dashboard_url" {
  description = "Dashboard URL of the existing watsonx Assistant instance."
  value       = module.existing_watsonx_assistant_instance.dashboard_url
}
