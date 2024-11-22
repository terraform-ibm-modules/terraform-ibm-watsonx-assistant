# Terraform IBM Watsonx Assistant

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-watsonx-assistant?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-assistant/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

The IBM watsonx Assistant Terraform Module is designed to automate the deployment and configuration of the IBM watsonx Assistant, a next-generation conversational AI solution.

For further information on IBM watsonx Assistant, including supported features, plans, and regions, please refer the official watsonx Assistant [documentation](https://cloud.ibm.com/docs/watson-assistant?topic=watson-assistant-welcome-new-assistant)

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-watsonx-assistant](#terraform-ibm-watsonx-assistant)
* [Examples](./examples)
    * [Basic example](./examples/basic)
    * [Existing Instance example](./examples/existing-instance)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->

## terraform-ibm-watsonx-assistant

This module supports provisioning the watsonx Assistant instance with a selectable service plan.

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl

module "watsonx_assistant" {
  source            = "terraform-ibm-modules/watsonx-assistant/ibm"
  region            = "us-south"
  assistant_name    = "example-wx-assistant-basic"
  plan              = "lite"
  resource_group_id = module.resource_group.resource_group_id
}

```

### Required IAM access policies

- Account Management
    * **Resource Group** service
        - `Viewer` platform access
- IAM Services
    * **watsonx Assistant** service
        - `Editor` platform access
        - `Manager` platform access (required to enable metrics)

To attach access management tags to resources in this module, you need the following permissions.

- IAM Services
    - **Tagging** service
        - `Administrator` platform access


<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the 'Sample IBM Cloud' service and roles with applicable values.
The required information can usually be found in the services official
IBM Cloud documentation.
To view all available service permissions, you can go in the
console at Manage > Access (IAM) > Access groups and click into an existing group
(or create a new one) and in the 'Access' tab click 'Assign access'.
-->

<!--
You need the following permissions to run this module:

- Service
    - **Resource group only**
        - `Viewer` access on the specific resource group
    - **Sample IBM Cloud** service
        - `Editor` platform access
        - `Manager` service access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.70.1, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.watsonx_assistant_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_tag.watsonx_assistant_tag](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |
| [ibm_resource_instance.existing_assistant_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the watsonx Assistance instance created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial. | `list(string)` | `[]` | no |
| <a name="input_existing_watsonx_assistant_instance_crn"></a> [existing\_watsonx\_assistant\_instance\_crn](#input\_existing\_watsonx\_assistant\_instance\_crn) | CRN of the an existing watsonx Assistant instance. | `string` | `null` | no |
| <a name="input_existing_watsonx_assistant_instance_name"></a> [existing\_watsonx\_assistant\_instance\_name](#input\_existing\_watsonx\_assistant\_instance\_name) | The name of an existing watsonx Assistant instance. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | IBM Cloud region where the watsonx Assistant instance will be created. Required if creating a new instance. If using an existing instance, this can be null. | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The Id of an IBM Cloud resource group where the watsonx Assistant instance will be grouped. Required when creating a new instance. | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Metadata labels describing this watsonx Assistant instance. | `list(string)` | `[]` | no |
| <a name="input_watsonx_assistant_name"></a> [watsonx\_assistant\_name](#input\_watsonx\_assistant\_name) | The name of the watsonx Assistant instance. Required if creating a new instance. | `string` | `null` | no |
| <a name="input_watsonx_assistant_plan"></a> [watsonx\_assistant\_plan](#input\_watsonx\_assistant\_plan) | The plan that is required to provision the watsonx Assistant instance. | `string` | `null` | no |
| <a name="input_watsonx_assistant_service_endpoints"></a> [watsonx\_assistant\_service\_endpoints](#input\_watsonx\_assistant\_service\_endpoints) | The type of service endpoints. Possible values: 'public', 'private', 'public-and-private'. | `string` | `"public"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_watsonx_assistant_crn"></a> [watsonx\_assistant\_crn](#output\_watsonx\_assistant\_crn) | The CRN of the watsonx Assistant instance. |
| <a name="output_watsonx_assistant_dashboard_url"></a> [watsonx\_assistant\_dashboard\_url](#output\_watsonx\_assistant\_dashboard\_url) | The dashboard URL of the watsonx Assistant instance. |
| <a name="output_watsonx_assistant_guid"></a> [watsonx\_assistant\_guid](#output\_watsonx\_assistant\_guid) | The GUID of the watsonx Assistant instance. |
| <a name="output_watsonx_assistant_name"></a> [watsonx\_assistant\_name](#output\_watsonx\_assistant\_name) | The name of the watsonx Assistant instance. |
| <a name="output_watsonx_assistant_plan_id"></a> [watsonx\_assistant\_plan\_id](#output\_watsonx\_assistant\_plan\_id) | The plan ID of the watsonx Assistant instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
