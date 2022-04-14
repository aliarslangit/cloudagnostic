module "azure_vm" {
  source        = "../azure modules/azure vm"
  rgname        = local.rg
  vmname        = "demo-vm-01"
  location      = "east us"
  adminuser     = "vmuser"
  adminpassword = "Adm!nistr@tor"
  vmsize        = "Standard_F2"
}
