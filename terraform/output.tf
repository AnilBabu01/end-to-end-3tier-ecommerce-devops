output "instance_public_ip" {
  value = aws_instance.batbazar.public_ip
}

output "instance_public_dns" {
  value = aws_instance.batbazar.public_dns
}

output "hosted_zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "name_servers" {
  value = aws_route53_zone.main.name_servers
}

output "frontend_url" {
  value = "http://ffindiano1.xyz"
}

output "admin_url" {
  value = "http://admin.ffindiano1.xyz"
}

output "api_url" {
  value = "http://api.ffindiano1.xyz"
}