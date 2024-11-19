########################################################################################################################
# Input Variables
########################################################################################################################

variable "ibmcloud_api_key" {
  description = "The API key that is used with the IBM Cloud Terraform IBM provider."
  sensitive   = true
  type        = string
}

variable "resource_group_id" {
  description = "The resource group ID where the watsonx Assistant instance is created."
  type        = string
}

variable "region" {
  default     = "us-south"
  description = "The region that is used with the IBM Cloud Terraform IBM provider. It's also used during resource creation."
  type        = string
}

variable "tags" {
  type        = list(string)
  description = "Metadata labels describing this watsonx Assistant instance."
  default     = []
}

variable "watsonx_assistant_name" {
  type        = string
  description = "The name of the watsonx assistant instance."
}

variable "existing_assistant_instance" {
  default     = null
  description = "CRN of the an existing watsonx Assistant instance."
  type        = string
}

variable "watsonx_assistant_plan" {
  default     = "trial"
  description = "The plan that is required to provision the watsonx Assistant instance."
  type        = string
  validation {
    condition = anytrue([
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
  default     = "public"
  description = "The type of service endpoints. Possible values: 'public', 'private', 'public-and-private'."
  type        = string
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.watsonx_assistant_service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are public, public-and-private, or private."
  }
}
