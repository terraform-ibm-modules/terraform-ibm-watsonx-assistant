##############################################################################
# Input Variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "use_existing_resource_group" {
  type        = bool
  description = "Whether to use an existing resource group."
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of a new or an existing resource group to provision the watsonx Assistant in. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all resources created by this solution."
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the watsonx Assistant instance. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
  default     = "watsonx-assistant"
}

variable "region" {
  description = "The region where you want to deploy your instance."
  type        = string
  default     = "us-south"
}

##############################################################################
# watsonx Assistant properties
##############################################################################
variable "plan" {
  type        = string
  description = "The plan that is required to provision the watsonx Assistant instance. [Learn more](https://www.ibm.com/products/watsonx-assistant/pricing)."
  default     = "plus-trial"
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to the watsonx Assistant instance."
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watsonx Assistant instance created by the solution. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial)."
  default     = []
}
