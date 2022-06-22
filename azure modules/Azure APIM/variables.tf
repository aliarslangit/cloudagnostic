//-------------------------------Service principal------------------------------//

variable "azure_subscription_id" {
  type        = string
  default     = ""
  description = "description"
}

variable "azure_client_id" {
  type        = string
  default     = ""
  description = "description"
}

variable "azure_client_secret" {
  type        = string
  default     = ""
  description = "description"
}

variable "azure_tenant_id" {
  type        = string
  default     = ""
  description = "description"
}

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

//------------------------TAGS------------------------------------------//
variable "environment"{
  type = string
  default = "Dev"
}