

//------------------------CONFIGIRATIONS------------------------------------------//

variable "rgname" {
  default = "test_demorgapim"
}
variable "apimname" {
  default = "demoapim"
}

variable "location" {
  type    = string
  default = "East US"
}
variable "sku" {
  type    = string
  default = "Developer"
}


variable "units" {
  type    = string
  default = "1"
}

variable "cloud" {
  default = "azure"
}
