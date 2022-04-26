
//------------------------------------General Properties------------------------------------\\
variable "vmname" {
  type    = string
  default = "demo-vm"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}
//------------------------------------VM Configurations------------------------------------\\
# variable "adminuser" {
#   type    = string
#   default = "vmuser"
# }
# variable "adminpassword" {
#   type    = string
#   default = "P@ssw0rd!234"
# }
variable "machine_type" {
  type    = string
  default = "e2-small"
}
variable "cloud" {
  default = "azure"
}
variable "accesstoken" {
  default = "test"
}
