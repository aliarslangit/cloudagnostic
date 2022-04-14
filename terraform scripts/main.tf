module "azure_vm" {
  source        = "../azure modules/azure vm"
  rgname        = local.rg
  vmname        = "az-ss-vn-uks-dev-ch-01"
  location      = "az-ss-sn-uks-dev-ch-01"
  adminuser     = ""
  adminpassword = ""
}
