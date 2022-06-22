provider "azurerm" {

  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider

  version = "=2.30.0"

  subscription_id = var.azure_subscription_id

  client_id = var.azure_client_id

  client_secret = var.azure_client_secret

  tenant_id = var.azure_tenant_id

  features {}

}
