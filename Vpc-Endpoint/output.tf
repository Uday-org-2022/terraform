#vpc output variables
output "vpc_id" {
  value = aws_vpc.endpoint-vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_sg_id" {
  value = aws_security_group.public-sg.id
}

output "private_sg_id" {
  value = aws_security_group.private-sg.id
}

output "endpoint_sg_id" {
  value = aws_security_group.main.id
}

output "role_id" {
  value = aws_iam_role.s3_access_role.id
}


output "public_instance_id" {
  value = aws_instance.public_instance.id
}

output "private_instance_id" {
  value = aws_instance.private_instance.id
}