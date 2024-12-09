########################################################################################################################
# Watsonx Assistant
########################################################################################################################

module "existing_watsonx_assistant_instance" {
  source                                  = "../../"
  access_tags                             = var.access_tags
  existing_watsonx_assistant_instance_crn = var.existing_watsonx_assistant_instance_crn
}
