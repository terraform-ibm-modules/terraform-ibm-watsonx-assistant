########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The resource group ID where the watsonx Assistant instance will be grouped. Required when creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_assistant_instance_crn != null || var.resource_group_id != null
    error_message = "You must specify a value for \"resource_group_id\" if \"existing_watsonx_assistant_instance_crn\" is null."
  }
}

variable "region" {
  description = "Region where the watsonx Assistant instance will be provisioned. Required if creating a new instance."
  type        = string
  default     = "us-south"

  validation {
    condition = var.existing_watsonx_assistant_instance_crn != null || anytrue([
      var.region == "eu-de",
      var.region == "us-south",
      var.region == "eu-gb",
      var.region == "jp-tok",
      var.region == "au-syd",
      var.region == "us-east"
    ])
    error_message = "Region must be specified and set to one of the permitted values (\"eu-de\", \"eu-gb\", \"jp-tok\", \"au-syd\", \"us-east\", \"us-south\") when provisioning a new instance."
  }
}

variable "resource_tags" {
  description = "Optional list of tags to describe the watsonx Assistant instance."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watsonx Assistant instance created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial."
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
  description = "The CRN of an existing watsonx Assistant instance."
  type        = string
  default     = null
}

variable "plan" {
  description = "The plan that is required to provision the watsonx Assistant instance. For `Trial` and `Lite` accounts, the `service_endpoints` value is ignored and the default service configuration is applied."
  type        = string
  default     = "plus-trial"

  validation {
    condition     = var.existing_watsonx_assistant_instance_crn != null || var.plan != null
    error_message = "watsonx Assistant plan must be provided when creating a new instance."
  }
  validation {
    condition = anytrue([
      var.plan == "plus-trial", #  Refers to Trial Account
      var.plan == "free",       # Refers to Lite account
      var.plan == "plus",
      var.plan == "enterprise",
      var.plan == "enterprisedataisolation",
    ]) || var.existing_watsonx_assistant_instance_crn != null
    error_message = "A new watsonx Assistant instance requires a \"Trial\", \"Lite\", \"Plus\", \"Enterprise\", or \"Enterprise with Data Isolation\" plan. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-admin-managing-plan)."
  }
}

variable "service_endpoints" {
  description = "Types of the service endpoints that can be set to a watsonx Assistant instance. Possible values are : public, private or public-and-private. For `Trial` and `Lite` accounts, the value is ignored and the default service configuration is applied."
  type        = string
  default     = "public-and-private"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are \"public\", \"private\", \"public-and-private\"."
  }
}
