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

module "azureapim" {
  source   = "../azure modules/Azure APIM"
  rgname   = "rg-apim"
  apimname = "demo-apim"
  location = "East US"
  sku      = "developer"
  units    = "1"
}

module "azuresql" {
  source        = "../azure modules/Azure Sql"
  rgname        = ""
  location      = ""
  dbname        = ""
  dbsize        = ""
  staccountname = ""
  firewallrules = ""
}
module "azurelb" {
  source       = "../azure modules/Azure LoadBalancer"
  rgname       = ""
  location     = ""
  lbname       = ""
  backendpools = ""
  lbrules      = ""
}
module "gcp_vm" {
  source = "../gcp modules/gcp compute engine"
  cloud  = local.cloud
}
module "gcp_function" {
  source = "../gcp modules/gcp cloud function"


}
