data "aws_ami" "joindevops" {
    most_recent = true ## This should be always true because its latest updated content
    owners = ["973714476881"]
    filter {
      name = "name"
      values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
      
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

}

# output "ami_id" {
#     value = data.aws_ami.joindevops.id
  
# }

