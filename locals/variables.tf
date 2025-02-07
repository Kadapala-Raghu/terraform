
variable "project" {
    default = "expense"
  
}
variable "component" {
    default = "backend"
  
  }

variable "environment" {
    default = "dev"
  
}

# variable "name" {

#     default = "${var.project}-${var.component}-${var.environment}"
  
# }



/*

Here if we can call var.name inside the ec2.tf block it won't executed as its not accteped expression under the varible block secion
so that the expression can accept the local

var.name it won't workcheck 
local.name 

*/
