//------------------------------------Service Principal---------------\\
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
//--------------------------------General Properties----------------\\
variable "rgname" {
  type    = string
  default = "RG-demo-SQL"
}
variable "sqlservername" {
  type    = string
  default = "demo-sql=100121"
}

variable "location" {
  type    = string
  default = "West US"
}
//-----------------------------------SQL CONFIGURATIONS-------------------\\
variable "username" {
  type    = string
  default = "adminuser"
}
variable "password" {
  type    = string
  default = "M@gento12345"
}
variable "dbname" {
  type    = string
  default = "demosqldemodb"
}
variable "dbsize" {
  type    = string
  default = "10"
}
variable "staccountname" {
  type    = string
  default = "demostaccount"

}
variable "firewallrules" {
  type = list(any)
  default = [
    {
      startip = "10.0.0.1"
      endip   = "10.0.0.1"
    },
    {
      startip = "10.0.0.2"
      endip   = "10.0.0.2"
    }
  ]
}
//------------------------------------TAGS-------------------------\\
variable "owner" {
  type        = string
  default     = "Ali Arslan"
  description = "description"
}

variable "Environment" {
  type        = string
  default     = "Dev"
  description = "Enter storage account name"
}


//------------------------------------------TF Errors------------------------\\
variable "init_stderr" {
  type    = string
  default = "error"
}
variable "init_stdout" {
  type    = string
  default = "error"
}
variable "stderr" {
  type    = string
  default = "error"
}
variable "stdout" {
  type = list(any)
  default = [
    {
      id          = 1
      name        = "error"
      description = "error"
    }
  ]
}

