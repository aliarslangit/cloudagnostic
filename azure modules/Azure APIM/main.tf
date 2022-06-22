# Create ResourceGroup
resource "azurerm_resource_group" "main" {
  name     = var.rgname
  location = var.location
}


# Create application insights
resource "azurerm_application_insights" "main" {
  name                = "${var.apimname}_AppInsight_${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 10
}

locals {
  skuname = "${var.sku}_${var.units}"
}

# Create APIM

resource "azurerm_api_management" "main" {
  name                = var.apimname
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  publisher_name      = "main"
  publisher_email     = "company@terraform.io"

  sku_name = local.skuname
  tags = {
    "Environment" = var.environment
  }
}

#enabling application insights and logging for APIM
resource "azurerm_api_management_logger" "main" {
  name                = "${var.apimname}-Logger"
  api_management_name = azurerm_api_management.main.name
  resource_group_name = azurerm_resource_group.main.name

  application_insights {
    instrumentation_key = azurerm_application_insights.main.instrumentation_key
  }
}
