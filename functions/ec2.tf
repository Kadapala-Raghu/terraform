resource "aws_instance" "expense" {
  count = 3
  ami                    = "ami-09c813fb71547fc4f" ## This AMI joindevops 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"

  tags = {
    Name    = var.instances[count.index]
    
      }
}

resource "aws_security_group" "allow_tls" {
  name        = "all-tls"
  description = "Allow TLS inbound traffic and outbound traffic"

  ingress {         ## Here ingress means INCOMING traffic
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
  egress  {     ## OUTGOING traffic
    from_port = 0
    to_port   = 0
    protocol  = "-1" # semantically equivalent to all
  }
}