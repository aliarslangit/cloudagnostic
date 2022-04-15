provider "azurerm" {
  features {}
}
locals {
  cloud = "azure"
}
module "azure_vm" {
  source        = "../azure modules/azure vm"
  rgname        = "rg-vm"
  vmname        = "demo-vm-01"
  location      = "east us"
  adminuser     = "vmuser"
  adminpassword = "Adm!nistr@tor"
  vmsize        = "Standard_D2"
  cloud         = local.cloud
}
