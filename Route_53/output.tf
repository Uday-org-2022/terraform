output "public_zone_id" {
  value       = aws_route53_zone.public.zone_id
  description = "Created public root zones."
}

output "private_zone_id" {
  value = aws_route53_zone.private.zone_id
}

output "public_NS" {
  value       = aws_route53_zone.public.name_servers
  description = "Created public root zones."
}

output "private_NS" {
  value = aws_route53_zone.private.name_servers
}