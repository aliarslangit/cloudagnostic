# Create ResourceGroup
resource "azurerm_resource_group" "main" {
  name     = var.rgname
  location = var.location
}

# Create Azure KeyVaylt
resource "azurerm_key_vault" "main" {
  name                        = var.keyvaultname
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.azure_tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  sku_name                    = var.sku

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules       = ["10.10.10.10"]
  }
  tags = {
    Environment = var.environment,
  }
}

# Create Azure KeyVaylt Access Policy

resource "azurerm_key_vault_access_policy" "main" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.azure_tenant_id
  object_id    = var.azure_client_id

  key_permissions = [
    "get",
  ]
  secret_permissions = [
    "get",
  ]
  storage_permissions = [
    "get",
  ]
}

