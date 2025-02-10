resource "aws_route53_record" "expense" {
    for_each = aws_instance.this
    zone_id = "Z0720608U79R1SW06Z12"
    name =  each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    ttl =   1
    type = "A"
    records = each.key == "frontend" ? [each.value.public_ip] : [each.key.private_ip]
    allow_overwrite = true
}