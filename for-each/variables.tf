variable "instances" {
    type = map
    default = {
        mqsql   ="t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
  
}

variable "domain_name" {
    default = "devopsyugam.site"
  
}