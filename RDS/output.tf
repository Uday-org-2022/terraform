output "instance_id" {
  value       = join("", aws_db_instance.db.*.id)
  description = "ID of the instance"
}

output "instance_arn" {
  value       = aws_db_instance.db.*.arn
  description = "ARN of the instance"
}

output "instance_address" {
  value       = join("", aws_db_instance.db.*.address)
  description = "Address of the instance"
}

output "instance_endpoint" {
  value       = join("", aws_db_instance.db.*.endpoint)
  description = "DNS Endpoint of the instance"
}

output "subnet_group_id" {
  value       = join("", aws_db_subnet_group.db_subnet.*.id)
  description = "ID of the created Subnet Group"
}

output "security_group_id" {
  value       = join("", aws_security_group.security.*.id)
  description = "ID of the Security Group"
}



output "resource_id" {
  value       = join("", aws_db_instance.db.*.resource_id)
  description = "The RDS Resource ID of this instance."
}