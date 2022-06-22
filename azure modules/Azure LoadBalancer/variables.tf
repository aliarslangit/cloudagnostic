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
//------------------------General Properties------------------------------------------//
variable "lbname" {
  type    = string
  default = "demo-lb"

}
variable "rgname" {
  type    = string
  default = "RG-demo-LB"

}
variable "location" {
  type    = string
  default = "West US"
}
//----------------------------------------Load Balancer Configurations---------------------------//

variable "backendpools" {
  type = list(string)
  default = [
    "backendpool1", "backendpool2"
  ]
}
variable "lbrules" {
  type = list(any)
  default = [
    {
      backendport  = "3389"
      frontendport = "3389"
    },
    {
      backendport  = "80"
      frontendport = "80"
    }
  ]
}

//------------------------------------TAGS-------------------------\\

variable "Environment" {
  type    = string
  default = "Dev"

}






