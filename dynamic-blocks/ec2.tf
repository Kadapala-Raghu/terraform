resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f" ## This AMI joindevops 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t2.micro"

  tags = {
    name    = "terraform-demo"
    Purpose = "terraform practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "all_tls"
  description = "Allow TLS inbound traffic and outbound traffic"

  dynamic ingress {         ## Here ingress means INCOMING traffic
    for_each = var.ingress_ports
    content{
          from_port   = ingress.value["from_port"]
          to_port     = ingress.value["to_port"]
          protocol    = ingress.value["protocol"]
          cidr_blocks = ingress.value["cidr_blocks"]
    }
    
  }
    
  egress  {     ## OUTGOING traffic
    from_port = 0
    to_port   = 0
    protocol  = "-1" # semantically equivalent to all
  }
}