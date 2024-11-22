########################################################################################################################
# Watsonx Assistant
########################################################################################################################

data "ibm_resource_instance" "existing_assistant_instance" {
  count      = var.existing_watsonx_assistant_instance_crn != null ? 1 : 0
  identifier = var.existing_watsonx_assistant_instance_crn
}

module "existing_watsonx_assistant_instance" {
  count                                    = var.existing_watsonx_assistant_instance_crn != null ? 1 : 0
  source                                   = "../../"
  access_tags                              = var.access_tags
  existing_watsonx_assistant_instance_crn  = var.existing_watsonx_assistant_instance_crn
  existing_watsonx_assistant_instance_name = data.ibm_resource_instance.existing_assistant_instance[0].name
  watsonx_assistant_plan                   = data.ibm_resource_instance.existing_assistant_instance[0].plan
  resource_group_id                        = data.ibm_resource_instance.existing_assistant_instance[0].resource_group_id
}
