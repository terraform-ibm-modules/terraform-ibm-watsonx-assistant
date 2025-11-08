##############################################################################
# Watsonx Assistant
##############################################################################

locals {
  account_id                      = var.existing_watsonx_assistant_instance_crn != null ? module.crn_parser[0].account_id : ibm_resource_instance.watsonx_assistant_instance[0].account_id
  watsonx_assistant_id            = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].id : ibm_resource_instance.watsonx_assistant_instance[0].id
  watsonx_assistant_crn           = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].crn : ibm_resource_instance.watsonx_assistant_instance[0].crn
  watsonx_assistant_guid          = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].guid : ibm_resource_instance.watsonx_assistant_instance[0].guid
  watsonx_assistant_name          = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].resource_name : ibm_resource_instance.watsonx_assistant_instance[0].resource_name
  watsonx_assistant_plan_id       = var.existing_watsonx_assistant_instance_crn != null ? null : ibm_resource_instance.watsonx_assistant_instance[0].resource_plan_id
  watsonx_assistant_dashboard_url = var.existing_watsonx_assistant_instance_crn != null ? null : ibm_resource_instance.watsonx_assistant_instance[0].dashboard_url
}

module "crn_parser" {
  count   = var.existing_watsonx_assistant_instance_crn != null ? 1 : 0
  source  = "terraform-ibm-modules/common-utilities/ibm//modules/crn-parser"
  version = "1.3.0"
  crn     = var.existing_watsonx_assistant_instance_crn
}

data "ibm_resource_instance" "existing_assistant_instance" {
  count      = var.existing_watsonx_assistant_instance_crn != null ? 1 : 0
  identifier = var.existing_watsonx_assistant_instance_crn
}

resource "ibm_resource_instance" "watsonx_assistant_instance" {
  count             = var.existing_watsonx_assistant_instance_crn != null ? 0 : 1
  resource_group_id = var.resource_group_id
  name              = var.watsonx_assistant_name
  location          = var.region
  service           = "conversation"
  plan              = var.plan
  tags              = var.resource_tags
  service_endpoints = var.service_endpoints

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

##############################################################################
# Attach Access Tags
##############################################################################

resource "ibm_resource_tag" "watsonx_assistant_tag" {
  count       = length(var.access_tags) == 0 ? 0 : 1
  resource_id = local.watsonx_assistant_crn
  tags        = var.access_tags
  tag_type    = "access"
}
