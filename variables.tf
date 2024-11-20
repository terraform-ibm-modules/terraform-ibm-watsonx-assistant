########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The Id of an existing IBM Cloud resource group where the watsonx Assistant instance will be grouped."
  type        = string
}

variable "region" {
  description = "IBM Cloud region where watsonx Assistant instance will be created."
  type        = string
}

variable "tags" {
  description = "Metadata labels describing this watsonx Assistant instance."
  type        = list(string)
  default     = []
}

variable "assistant_name" {
  description = "The name of the watsonx assistant instance."
  type        = string
}

variable "existing_assistant_instance" {
  description = "CRN of the an existing watsonx Assistant instance."
  type        = string
  default     = null
}

variable "plan" {
  description = "The plan that is required to provision the watsonx Assistant instance."
  type        = string
  default     = "trial"
  validation {
    condition = anytrue([
      var.plan == "trial",
      var.plan == "lite",
      var.plan == "plus",
      var.plan == "enterprise",
      var.plan == "enterprisedataisolation",
    ])
    error_message = "You must use a Trial, Lite, Plus, Enterprise, or Enterprise with data isolation plan. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-admin-managing-plan)."
  }
  validation {
    condition     = !(contains(["trial", "lite"], var.plan) && var.service_endpoints != "public")
    error_message = "The 'Trial' and 'Lite' plans only support public endpoints."
  }
}

variable "service_endpoints" {
  description = "The type of service endpoints. Possible values: 'public', 'private', 'public-and-private'."
  type        = string
  default     = "public"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are public, public-and-private, or private."
  }
}
