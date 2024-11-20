locals {
  assistant_crn           = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].crn : resource.ibm_resource_instance.assistant_instance[0].crn
  assistant_guid          = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].guid : resource.ibm_resource_instance.assistant_instance[0].guid
  assistant_name          = var.existing_assistant_instance != null ? data.ibm_resource_instance.existing_assistant_instance[0].resource_name : ibm_resource_instance.assistant_instance[0].resource_name
  assistant_plan_id       = var.existing_assistant_instance != null ? null : resource.ibm_resource_instance.assistant_instance[0].resource_plan_id
  assistant_dashboard_url = var.existing_assistant_instance != null ? null : resource.ibm_resource_instance.assistant_instance[0].dashboard_url
}

data "ibm_resource_instance" "existing_assistant_instance" {
  count      = var.existing_assistant_instance != null ? 1 : 0
  identifier = var.existing_assistant_instance
}

resource "ibm_resource_instance" "assistant_instance" {
  count             = var.existing_assistant_instance != null ? 0 : 1
  resource_group_id = var.resource_group_id
  name              = var.assistant_name
  location          = var.region
  service           = "conversation"
  plan              = var.plan
  tags              = var.tags
  service_endpoints = var.service_endpoints

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
