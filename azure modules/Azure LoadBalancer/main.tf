resource "azurerm_resource_group" "main" {
  name     = var.lbname
  location = var.location

}

resource "azurerm_public_ip" "main" {
  name                = "PublicIPForLB"
  location            = var.location
  sku                 = "Standard"
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  tags = {
    Environment = var.Environment,
  }
}

resource "azurerm_lb" "main" {
  name                = var.lbname
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  tags = {
    Environment = var.Environment,
  }
}
resource "azurerm_lb_backend_address_pool" "main" {
  loadbalancer_id     = azurerm_lb.main.id
  for_each            = toset(var.backendpools)
  name                = each.key
  resource_group_name = azurerm_lb.main.name
}
resource "azurerm_lb_rule" "main" {
  count                          = length(var.lbrules)
  resource_group_name            = azurerm_resource_group.main.name
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "LBRule-${count.index}"
  protocol                       = "Tcp"
  frontend_port                  = lookup(element(var.lbrules, count.index), "frontendport")
  backend_port                   = lookup(element(var.lbrules, count.index), "backendport")
  frontend_ip_configuration_name = "PublicIPAddress"
}

