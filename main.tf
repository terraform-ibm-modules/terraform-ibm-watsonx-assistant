locals {
  watsonx_assistant_crn           = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].crn : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].crn : null
  watsonx_assistant_guid          = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].guid : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].guid : null
  watsonx_assistant_name          = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].resource_name : var.watsonx_assistant_plan != "do not install" ? ibm_resource_instance.assistant_instance[0].resource_name : null
  watsonx_assistant_plan_id       = var.existing_assistant_instance != null ? null : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].resource_plan_id : null
  watsonx_assistant_dashboard_url = var.existing_assistant_instance != null ? null : var.watsonx_assistant_plan != "do not install" ? resource.ibm_resource_instance.assistant_instance[0].dashboard_url : null
}

data "ibm_resource_instance" "existing_assistant_instance" {
  count      = var.existing_assistant_instance != null ? 1 : 0
  identifier = var.existing_assistant_instance
}

resource "ibm_resource_instance" "assistant_instance" {
  count             = var.existing_assistant_instance != null ? 0 : 1
  resource_group_id = var.resource_group_id
  name              = var.watsonx_assistant_name
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
