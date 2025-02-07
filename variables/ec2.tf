


resource "aws_instance" "this" {  
  ami                    = var.ami_id ## var.amiId= declared ami value inside the variables.tf file
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.instance_type   ## from variable.tf file

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
  name        = "all-tls"
  description = "Allow TLS inbound traffic and outbound traffic"

  ingress {         ## Here ingress means INCOMING traffic
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
    
  egress  {     ## OUTGOING traffic
    from_port = 0
    to_port   = 0
    protocol  = "-1" # semantically equivalent to all
  }
  tags = var.sg_tags
}