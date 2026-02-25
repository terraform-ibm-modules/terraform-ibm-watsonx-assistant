########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "existing_watsonx_assistant_instance_crn" {
  description = "The CRN of an existing watsonx Assistant instance."
  type        = string
}

variable "access_tags" {
  type        = list(string)
  description = "Add access management tags to the Watsonx Assistant instance to control access. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#create-access-console)."
  default     = []
}
