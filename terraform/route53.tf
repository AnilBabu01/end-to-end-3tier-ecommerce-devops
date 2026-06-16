resource "aws_route53_zone" "main" {
  name = var.hosted_zone_name
}

resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "ffindiano1.xyz"
  type    = "A"
  ttl     = 300

  records = [
    aws_instance.batbazar.public_ip
  ]
}

resource "aws_route53_record" "admin" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "admin.ffindiano1.xyz"
  type    = "A"
  ttl     = 300

  records = [
    aws_instance.batbazar.public_ip
  ]
}

resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.ffindiano1.xyz"
  type    = "A"
  ttl     = 300

  records = [
    aws_instance.batbazar.public_ip
  ]
}