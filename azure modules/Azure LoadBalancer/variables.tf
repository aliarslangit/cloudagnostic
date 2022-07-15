
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






