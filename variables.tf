########################################################################################################################
# Input Variables
########################################################################################################################

variable "watsonx_assistance_name" {
  type        = string
  description = "The name of the watsonx assistance instance."
}

variable "resource_group_id" {
  description = "The resource group ID where the Event Streams instance is created."
  type        = string
}

variable "region" {
  default     = "us-south"
  description = "The region that's used with the IBM Cloud Terraform IBM provider. It's also used during resource creation."
  type        = string
  validation {
    condition     = contains(["eu-de", "us-south", "eu-gb", "jp-tok"], var.region)
    error_message = "You must specify `eu-de`, `eu-gb`, `jp-tok` or `us-south` as the IBM Cloud region."
  }
}

variable "existing_assistant_instance" {
  default     = null
  description = "CRN of the an existing watsonx Assistance instance."
  type        = string
}

variable "watsonx_assistant_plan" {
  default     = "do not install"
  description = "The plan that's used to provision the watsonx Assistance instance."
  type        = string
  validation {
    condition = anytrue([
      var.watsonx_assistant_plan == "do not install",
      var.watsonx_assistant_plan == "free",
      var.watsonx_assistant_plan == "plus-trial",
      var.watsonx_assistant_plan == "plus",
      var.watsonx_assistant_plan == "enterprise",
      var.watsonx_assistant_plan == "enterprisedataisolation",
    ])
    error_message = "You must use a free, trial, plus-trial, enterprise, or enterprisedataisolation plan. Learn more."
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
