########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The Id of an IBM Cloud resource group where the watsonx Assistant instance will be grouped."
  type        = string
}

variable "region" {
  description = "IBM Cloud region where watsonx Assistant instance will be created."
  type        = string
  default     = null
}

variable "tags" {
  description = "Metadata labels describing this watsonx Assistant instance."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watsonx Assistance instance created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression \"[\\w\\-_\\.]+:[\\w\\-_\\.]+\", see https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits for more details"
  }
}

variable "watsonx_assistant_name" {
  description = "The name of the watsonx assistant instance."
  type        = string
  default     = null
}

variable "existing_watsonx_assistant_instance_crn" {
  description = "CRN of the an existing watsonx Assistant instance."
  type        = string
  default     = null
}

variable "existing_watsonx_assistant_instance_name" {
  description = "The name of an existing watsonx Assistant instance."
  type        = string
  default     = null
}

variable "watsonx_assistant_plan" {
  description = "The plan that is required to provision the watsonx Assistant instance."
  type        = string
  default     = "trial"
  validation {
    condition = anytrue([
      var.watsonx_assistant_plan == "do not install",
      var.watsonx_assistant_plan == "trial",
      var.watsonx_assistant_plan == "lite",
      var.watsonx_assistant_plan == "plus",
      var.watsonx_assistant_plan == "enterprise",
      var.watsonx_assistant_plan == "enterprisedataisolation",
    ])
    error_message = "You must use a Trial, Lite, Plus, Enterprise, or Enterprise with data isolation plan. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-admin-managing-plan)."
  }
  validation {
    condition     = !(contains(["trial", "lite"], var.watsonx_assistant_plan) && var.watsonx_assistant_service_endpoints != "public")
    error_message = "The 'Trial' and 'Lite' plans only support public endpoints."
  }
}

variable "watsonx_assistant_service_endpoints" {
  description = "The type of service endpoints. Possible values: 'public', 'private', 'public-and-private'."
  type        = string
  default     = "public"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.watsonx_assistant_service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are public, public-and-private, or private."
  }
}
