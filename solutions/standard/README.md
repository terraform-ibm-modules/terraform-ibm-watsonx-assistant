# IBM watsonx Assistant

This architecture creates an instance of IBM watsonx Assistant and supports provisioning of the following resources:

- A resource group, if one is not passed in.
- A watsonx Assistant instance.

![watsonx-assistant-deployable-architecture](../../reference-architecture/deployable-architecture-watsonx-assistant.svg)

:exclamation: **Important:** This solution is not intended to be called by other modules because it contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).
