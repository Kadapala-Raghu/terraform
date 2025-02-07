resource "aws_route53_record" "expense" {
    count = 3
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.expense[count.index].private_ip]
    allow_overwrite = true ## it will allow you to overwrite
    }

resource "aws_route53_record" "expense-public" {
    zone_id = var.zone_id
    name = var.domain_name
    type = "A"
    ttl = 1
    records = [aws_instance.expense[2].public_ip]
    }

    ####  "${var.variable-name}".${var.variable-name}