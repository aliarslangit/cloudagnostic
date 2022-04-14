//------------------------------------Service Principal------------------------------------\\
variable "azure_subscription_id" {
  type    = string
  default = ""
}

variable "azure_client_id" {
  type    = string
  default = ""

}

variable "azure_client_secret" {
  type    = string
  default = ""

}

variable "azure_tenant_id" {
  type    = string
  default = ""

}

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

//------------------------------------TAGS------------------------------------\\
variable "creationdate" {
  type        = string
  default     = "1/1/1111"
  description = "description"
}

variable "environment" {
  type    = string
  default = "Dev"
}
