#######################################################################################################################
# Local block
#######################################################################################################################

locals {
  prefix = var.prefix != null ? (var.prefix != "" ? var.prefix : null) : null
}

#######################################################################################################################
# Resource Group
#######################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.2.1"
  resource_group_name          = var.use_existing_resource_group ? null : try("${local.prefix}-${var.resource_group_name}", var.resource_group_name)
  existing_resource_group_name = var.use_existing_resource_group ? var.resource_group_name : null
}

#######################################################################################################################
# watsonx Assistant
#######################################################################################################################

module "watsonx_assistant" {
  source                 = "../../"
  region                 = var.region
  plan                   = var.plan
  resource_group_id      = module.resource_group.resource_group_id
  watsonx_assistant_name = try("${local.prefix}-${var.name}", var.name)
  service_endpoints      = var.service_endpoints
  access_tags            = var.access_tags
  resource_tags          = var.resource_tags
}
