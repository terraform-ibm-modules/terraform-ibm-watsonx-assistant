########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The Id of an IBM Cloud resource group where the watsonx Assistant instance will be grouped. Required when creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_assistant_instance_crn != null || var.resource_group_id != null
    error_message = "Resource group id must be provided when existing_watsonx_assistant_instance_crn is not set."
  }
}

variable "region" {
  description = "IBM Cloud region where the watsonx Assistant instance will be created. Required if creating a new instance. If using an existing instance, this can be null."
  type        = string
  default     = null

  validation {
    condition = var.existing_watsonx_assistant_instance_crn != null || (var.region != null && anytrue([
      var.region == "eu-de",
      var.region == "us-south",
      var.region == "eu-gb",
      var.region == "jp-tok",
      var.region == "au-syd",
      var.region == "us-east"
    ]))
    error_message = "IBM Cloud Region must be provided and set to one of the allowed values ('eu-de', 'eu-gb', 'jp-tok', 'au-syd', 'us-east', 'us-south') when creating a new instance."
  }
}

variable "resource_tags" {
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
  description = "The name of the watsonx Assistant instance. Required if creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_assistant_instance_crn != null || var.watsonx_assistant_name != null
    error_message = "watsonx Assistant name must be provided when creating a new instance."
  }
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

variable "existing_watsonx_assistant_instance_plan" {
  description = "Plan type associated with an existing watsonx Assistant instance."
  type        = string
  default     = null
}

variable "watsonx_assistant_plan" {
  description = "The plan that is required to provision the watsonx Assistant instance."
  type        = string
  default     = null

  validation {
    condition     = var.existing_watsonx_assistant_instance_crn != null || var.watsonx_assistant_plan != null
    error_message = "watsonx Assistant plan must be provided when creating a new instance."
  }
  validation {
    condition = anytrue([
      var.watsonx_assistant_plan == "plus-trial", #  Refers to Trial Account
      var.watsonx_assistant_plan == "free",       # Refers to Lite account
      var.watsonx_assistant_plan == "plus",
      var.watsonx_assistant_plan == "enterprise",
      var.watsonx_assistant_plan == "enterprisedataisolation",
    ])
    error_message = "You must use a Trial, Lite, Plus, Enterprise, or Enterprise with data isolation plan. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-admin-managing-plan)."
  }
  validation {
    condition     = !(contains(["plus-trial", "free"], var.watsonx_assistant_plan) && var.watsonx_assistant_service_endpoints != "public")
    error_message = "The 'Trial' and 'Lite' plans only support public endpoints."
  }
  validation {
    condition = !(
      var.watsonx_assistant_plan == "free" &&
      anytrue([
        var.existing_watsonx_assistant_instance_plan == "plus-trial",
        var.existing_watsonx_assistant_instance_plan == "plus",
        var.existing_watsonx_assistant_instance_plan == "standard"
      ])
    )
    error_message = "Switching from the Trial, Plus, or Standard plans to the Lite plan is not supported. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-watson-assistant-faqs#faqs-downgrade-plan)"
  }
  validation {
    condition = !(
      var.existing_watsonx_assistant_instance_plan == "plus-trial" &&
      var.watsonx_assistant_plan == "standard"
    )
    error_message = "Upgrade from a Trial plan to a Standard plan is not supported. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-watson-assistant-faqs#faqs-downgrade-plan)"
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
