module "azure_vm" {
  source               = "../azure modules/vm"
  resource_group_name  = local.rg
  vnet_name            = "az-ss-vn-uks-dev-ch-01"
  subnet_name          = "az-ss-sn-uks-dev-ch-01"
  address_space        = ["10.2.0.0/16"]
  private_subnet_cidrs = ["10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24", "10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24", "10.2.7.0/24"]
}
