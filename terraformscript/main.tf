provider "azurerm" {
  features {}
}
provider "google" {
  #credentials = file("gcp-creds.json")
  access_token = var.accesstoken
  project      = "systems-cloud"
}
locals {
  cloud = var.cloud
}
module "azure_vm" {
  source        = "../azure modules/azure vm"
  rgname        = "rg-vm"
  vmname        = "demo-vm-01"
  location      = "East US"
  adminuser     = "vmuser"
  adminpassword = "Adm!nistr@tor"
  vmsize        = "Standard_F2"
  cloud         = local.cloud
}
module "gcp_vm" {
  source = "../gcp modules/gcp compute engine"
  cloud  = local.cloud
}
