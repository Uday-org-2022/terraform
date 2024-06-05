output "instance-id" {
  value = aws_instance.Ec2.id
}

output "subnet_id" {
  value = aws_instance.Ec2.subnet_id
}

output "security_group_id" {
  value = aws_instance.Ec2.vpc_security_group_ids
}