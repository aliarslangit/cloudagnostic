
//------------------------CONFIGIRATIONS------------------------------------------//

variable "rgname" {
  default = "test_rgkv"
}

variable "location" {
  default = "West US"
}

variable "keyvaultname" {
  default = "visionet-kv"
}

variable "sku" {
  default = "standard"
}


//------------------------------------TAGS-------------------------\\

variable "environment" {
  type    = string
  default = "Dev"
}

