output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.vpc.arn
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = aws_vpc.vpc.default_security_group_id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = aws_vpc.vpc.default_network_acl_id
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = aws_vpc.vpc.instance_tenancy
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = aws_vpc.vpc.enable_dns_support
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = aws_vpc.vpc.enable_dns_hostnames
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = aws_vpc.vpc.main_route_table_id
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = aws_vpc.vpc.owner_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private[*].arn
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public[*].arn
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.rt1[*].id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.rt2[*].id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.igw.arn
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.elastic-ip[*].id
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.nat[*].id
}