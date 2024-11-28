########################################################################################################################
# Outputs
########################################################################################################################

output "watsonx_assistant_crn" {
  description = "CRN of the watsonx Assistant instance"
  value       = module.watsonx_assistant.watsonx_assistant_crn
}
