##############################################################################
# Watsonx Assistant
##############################################################################

locals {
  watsonx_assistant_crn           = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].crn : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.watsonx_assistant_instance[0].crn : null
  watsonx_assistant_guid          = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].guid : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.watsonx_assistant_instance[0].guid : null
  watsonx_assistant_name          = var.existing_watsonx_assistant_instance_crn != null ? data.ibm_resource_instance.existing_assistant_instance[0].resource_name : var.watsonx_assistant_plan != "do not install" ? ibm_resource_instance.watsonx_assistant_instance[0].resource_name : null
  watsonx_assistant_plan_id       = var.existing_watsonx_assistant_instance_crn != null ? null : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.watsonx_assistant_instance[0].resource_plan_id : null
  watsonx_assistant_dashboard_url = var.existing_watsonx_assistant_instance_crn != null ? null : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.watsonx_assistant_instance[0].dashboard_url : null
}

data "ibm_resource_instance" "existing_assistant_instance" {
  count      = var.existing_watsonx_assistant_instance_crn != null ? 1 : 0
  identifier = var.existing_watsonx_assistant_instance_crn
}

resource "ibm_resource_instance" "watsonx_assistant_instance" {
  count             = var.existing_watsonx_assistant_instance_crn != null ? 0 : 1
  resource_group_id = var.resource_group_id
  name              = var.existing_watsonx_assistant_instance_name != null ? var.existing_watsonx_assistant_instance_name : var.watsonx_assistant_name
  location          = var.region
  service           = "conversation"
  plan              = var.watsonx_assistant_plan
  tags              = var.tags
  service_endpoints = var.watsonx_assistant_service_endpoints

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
  resource_id = ibm_resource_instance.watsonx_assistant_instance[0].crn
  tags        = var.access_tags
  tag_type    = "access"
}
