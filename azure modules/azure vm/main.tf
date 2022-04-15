#terraform script to create VM
locals {
  count = var.cloud == "azure" ? 1 : 0
}
resource "azurerm_resource_group" "main" {
  count    = local.count
  name     = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  count               = local.count
  name                = "${var.vmname}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main[count.index].location
  resource_group_name = azurerm_resource_group.main[count.index].name
}

resource "azurerm_subnet" "internal" {
  count                = local.count
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main[count.index].name
  virtual_network_name = azurerm_virtual_network.main[count.index].name
  address_prefixes     = ["10.0.2.0/24"]

}

resource "azurerm_public_ip" "main" {
  count               = local.count
  name                = "${var.vmname}-ip"
  location            = azurerm_resource_group.main[count.index].location
  resource_group_name = azurerm_resource_group.main[count.index].name
  allocation_method   = "Static"

}

resource "azurerm_network_interface" "main" {
  count               = local.count
  name                = "${var.vmname}-nic"
  location            = azurerm_resource_group.main[count.index].location
  resource_group_name = azurerm_resource_group.main[count.index].name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.internal[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main[count.index].id


  }

}
resource "azurerm_virtual_machine" "main" {
  count                            = local.count
  name                             = "${var.vmname}-vm"
  location                         = azurerm_resource_group.main[count.index].location
  resource_group_name              = azurerm_resource_group.main[count.index].name
  network_interface_ids            = [azurerm_network_interface.main[count.index].id]
  vm_size                          = var.vmsize
  delete_os_disk_on_termination    = true #to preserve os-disk after deletion, set this poperty to false
  delete_data_disks_on_termination = true #to preserve data-disk after deletion, set this poperty to false

  #Windows or marketplace images can be used as per the requirements
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vmname}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = var.adminuser
    admin_password = var.adminpassword
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}
