########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "existing_watsonx_assistant_instance_name" {
  description = "The name of an existing watsonx Assistant instance."
  type        = string
}
