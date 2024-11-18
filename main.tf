locals {
  watsonx_assistant_crn           = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].crn : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].crn : null
  watsonx_assistant_guid          = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].guid : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].guid : null
  watsonx_assistant_name          = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].resource_name : var.watsonx_assistant_plan != "do not install" ? ibm_resource_instance.assistant_instance[0].resource_name : null
  watsonx_assistant_plan_id       = var.existing_assistant_instance != null ? null : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].resource_plan_id : null
  watsonx_assistant_dashboard_url = var.existing_assistant_instance != null ? null : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].dashboard_url : null
}
data "ibm_resource_instance" "existing_assistant_instance" {
  provider   = ibm.deployer
  count      = var.existing_assistant_instance != null ? 1 : 0
  identifier = var.existing_assistant_instance
}

resource "ibm_resource_instance" "assistant_instance" {
  provider          = ibm.deployer
  count             = var.existing_assistant_instance != null ? 0 : var.watsonx_assistant_plan == "do not install" ? 0 : 1
  name              = var.watsonx_assistance_name
  location          = var.region
  resource_group_id = module.resource_group.resource_group_id
  service           = "conversation"
  plan              = var.watsonx_assistant_plan

  parameters = {
    service-endpoints = var.watsonx_assistant_service_endpoints
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }

  lifecycle {
    precondition {
      condition     = contains(["free", "plus-trial"], var.watsonx_assistant_plan) ? var.watsonx_assistant_service_endpoints == "public" : true
      error_message = "The free and plus-trial plans only support public endpoints."
    }
  }
}
