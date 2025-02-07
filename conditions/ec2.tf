resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f" ## This AMI joindevops 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.environment =="prod" ? "t3.small" : "t3.micro"

                ## above expression, we have defined the environment variable value "dev" in variables.tf so instance_type will be considering false stament i.e t3.micro

  tags = {
    name    = "terraform-demo"
    Purpose = "terraform practice"
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