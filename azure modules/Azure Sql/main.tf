resource "azurerm_resource_group" "demo" {
  name     = var.rgname
  location = var.location
  tags = {
    Environment = var.Environment
  }
}

resource "azurerm_sql_server" "demo" {
  name                         = var.sqlservername
  resource_group_name          = azurerm_resource_group.demo.name
  location                     = azurerm_resource_group.demo.location
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password
  tags = {
    Environment = var.Environment
  }
}

/*resource "azurerm_sql_firewall_rule" "demo" {
  count               = length(var.firewallrules)
  name                = "FirewallRule-${count.index}"
  resource_group_name = azurerm_resource_group.demo.name
  server_name         = azurerm_sql_server.demo.name
  start_ip_address    = lookup(element(var.firewallrules, count.index), "startip")
  end_ip_address      = lookup(element(var.firewallrules, count.index), "endip")
}*/

resource "azurerm_mssql_database" "demo" {
  name           = var.dbname
  server_id      = azurerm_sql_server.demo.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.dbsize
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = false

  tags = {
    Environment = var.Environment
  }
}

