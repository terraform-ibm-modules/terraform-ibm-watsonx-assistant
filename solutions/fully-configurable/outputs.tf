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

output "next_steps_text" {
  value       = "Now, you can start building your chatbot using watsonx Assistant."
  description = "Next steps text"
}

output "next_step_primary_label" {
  value       = "Go to IBM watsonx Assistant dashboard"
  description = "Primary label"
}

output "next_step_primary_url" {
  value       = module.watsonx_assistant.dashboard_url
  description = "Primary URL"
}

output "next_step_secondary_label" {
  value       = "Learn more about IBM watsonx Assistant"
  description = "Secondary label"
}

output "next_step_secondary_url" {
  value       = "https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-getting-started"
  description = "Secondary URL"
}
