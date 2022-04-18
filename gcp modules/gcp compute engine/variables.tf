
//------------------------------------General Properties------------------------------------\\
variable "rgname" {
  type    = string
  default = "RG-git-DEMO-LINUXVM"
}
variable "vmname" {
  type    = string
  default = "demo-vm"
}

variable "zone" {
  type    = string
  default = "asia-east1"
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
variable "machine_type" {
  type    = string
  default = "e2_medium"
}
variable "cloud" {
  default = "azure"
}
