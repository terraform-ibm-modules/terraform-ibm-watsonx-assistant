########################################################################################################################
# Watsonx Assistant
########################################################################################################################

data "ibm_resource_instance" "existing_assistant_instance" {
  count = var.existing_watsonx_assistant_instance_name != null ? 1 : 0
  name  = var.existing_watsonx_assistant_instance_name
}

module "existing_watsonx_assistant_instance" {
  count                                   = var.existing_watsonx_assistant_instance_name != null ? 1 : 0
  source                                  = "../../"
  existing_watsonx_assistant_instance_crn = data.ibm_resource_instance.existing_assistant_instance[0].crn
  resource_group_id                       = data.ibm_resource_instance.existing_assistant_instance[0].resource_group_id
}
