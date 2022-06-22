#Replace variables according to you environment.

//-------------------------------Service principal------------------------------//

variable "azure_subscription_id" {
  type        = string
  default     = "xxxxxxxxxxxxxxxxxxxx"
  description = "description"
}

variable "azure_client_id" {
  type        = string
  default     = "xxxxxxxxxxxxxxxxxxxx"
  description = "description"
}

variable "azure_client_secret" {
  type        = string
  default     = "xxxxxxxxxxxxxxxxxxxx"
  description = "description"
}

variable "azure_tenant_id" {
  type        = string
  default     = "xxxxxxxxxxxxxxxxxxxx"
  description = "description"
}

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

