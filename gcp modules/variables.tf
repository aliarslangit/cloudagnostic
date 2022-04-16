
//------------------------------------General Properties------------------------------------\\
variable "rgname" {
  type    = string
  default = "RG-git-DEMO-LINUXVM"
}
variable "vmname" {
  type    = string
  default = "demo-vm"
}

variable "location" {
  type    = string
  default = "West US"
}
//------------------------------------VM Configurations------------------------------------\\
variable "adminuser" {
  type    = string
  default = "vmuser"
}
variable "adminpassword" {
  type    = string
  default = "P@ssw0rd!234"
}
variable "vmsize" {
  type    = string
  default = "Standard_F2"
}
variable "cloud" {
  default = "azure"
}
