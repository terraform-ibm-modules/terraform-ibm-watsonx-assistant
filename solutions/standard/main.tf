#######################################################################################################################
# Resource Group
#######################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  resource_group_name          = var.use_existing_resource_group == false ? (var.prefix != null ? "${var.prefix}-${var.resource_group_name}" : var.resource_group_name) : null
  existing_resource_group_name = var.use_existing_resource_group == true ? var.resource_group_name : null
}

#######################################################################################################################
# watsonx Assistant
#######################################################################################################################

module "watsonx_assistant" {
  source                 = "../../"
  resource_group_id      = module.resource_group.resource_group_id
  watsonx_assistant_name = var.prefix != null ? "${var.prefix}-${var.name}" : var.name
  watsonx_assistant_plan = var.plan
  region                 = var.region
  access_tags            = var.access_tags
  resource_tags          = var.resource_tags
}
