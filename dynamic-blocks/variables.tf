variable "ingress_ports" {
    default = [
        {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks =["0.0.0.0/0"]
        }
    ]
  
}