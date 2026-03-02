########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The resource group ID where the watsonx Assistant instance will be grouped. Required when creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_assistant_instance_crn == null ? length(var.resource_group_id) > 0 : true
    error_message = "You must specify a value for 'resource_group_id' if 'existing_watsonx_assistant_instance_crn' is null."
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
    error_message = "Region must be specified and set to one of the permitted values ('eu-de', 'eu-gb', 'jp-tok', 'au-syd', 'us-east', 'us-south') when provisioning a new instance."
  }
}

variable "resource_tags" {
  description = "Add user resource tags to the watsonx Assistant instance to organize, track, and manage costs. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#tag-types)."
  type        = list(string)
  default     = []
  validation {
    condition     = alltrue([for tag in var.resource_tags : can(regex("^[A-Za-z0-9 _\\-.:](1, 128)$", tag))])
    error_message = "Each resource tag must be 128 characters or less and may contain only A-Z, a-z, 0-9, spaces, underscore (_), hyphen (-), period (.), and colon (:)."
  }
}

variable "access_tags" {
  type        = list(string)
  description = "Add access management tags to the watsonx Assistant instance to control access. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#create-access-console)."
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
    condition     = var.existing_watsonx_assistant_instance_crn == null ? length(var.watsonx_assistant_name) > 0 : true
    error_message = "watsonx Assistant name must be provided when creating a new instance."
  }
}

variable "existing_watsonx_assistant_instance_crn" {
  description = "The CRN of an existing watsonx Assistant instance.If not provided, a new instance will be provisioned."
  type        = string
  default     = null
}

variable "plan" {
  description = "The plan that is required to provision the watsonx Assistant instance. Possible values are: free, plus, enterprise. For 'free' plan, the `service_endpoints` value is ignored and the default service configuration is applied."
  type        = string
  default     = "free"

  validation {
    condition     = var.existing_watsonx_assistant_instance_crn != null || var.plan != null
    error_message = "watsonx Assistant plan must be provided when creating a new instance."
  }
  validation {
    condition = anytrue([
      var.plan == "free", # Refers to Lite account
      var.plan == "plus",
      var.plan == "enterprise",
    ]) || var.existing_watsonx_assistant_instance_crn != null
    error_message = "A new watsonx Assistant instance requires a 'free', 'plus' or 'enterprise' plan. [Learn more](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-admin-managing-plan)."
  }
}

variable "service_endpoints" {
  description = "Types of the service endpoints that can be set to a watsonx Assistant instance. Possible values are : public, private or public-and-private. For 'free' plan, the value is ignored and the default service configuration is applied."
  type        = string
  default     = "public-and-private"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are 'public', 'private', 'public-and-private'."
  }
}
