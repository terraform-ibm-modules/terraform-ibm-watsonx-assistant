#######################################################################################################################
# Local block
#######################################################################################################################

locals {
  prefix = var.prefix != null ? trimspace(var.prefix) != "" ? "${var.prefix}-" : "" : ""
}

#######################################################################################################################
# Resource Group
#######################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.4.8"
  existing_resource_group_name = var.existing_resource_group_name
}

#######################################################################################################################
# watsonx Assistant
#######################################################################################################################

module "watsonx_assistant" {
  source                 = "../../"
  region                 = var.region
  plan                   = var.plan
  resource_group_id      = module.resource_group.resource_group_id
  watsonx_assistant_name = var.name != null ? "${local.prefix}${var.name}" : null
  service_endpoints      = var.service_endpoints
  access_tags            = var.access_tags
  resource_tags          = var.resource_tags
}
