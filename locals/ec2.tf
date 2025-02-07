resource "aws_instance" "this" {
  ami                    = local.ami_id 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = local.instance_type

  tags = {
    name    = local.name
    # Purpose = "terraform practice"
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