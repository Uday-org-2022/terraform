output "vpc-id" {
  description = "The ID of the VPC"
  value       = module.aws-vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.aws-vpc.vpc_arn
}

output "security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.aws-vpc.default_security_group_id
}

output "network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.aws-vpc.default_network_acl_id
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = module.aws-vpc.vpc_instance_tenancy
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.aws-vpc.vpc_enable_dns_support
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.aws-vpc.vpc_enable_dns_hostnames
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = module.aws-vpc.vpc_main_route_table_id
}

output "owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = module.aws-vpc.vpc_owner_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.aws-vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.aws-vpc.private_subnet_arns
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.aws-vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.aws-vpc.public_subnet_arns
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.aws-vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.aws-vpc.private_route_table_ids
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.aws-vpc.igw_id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.aws-vpc.igw_arn
}

output "elastic_ip" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.aws-vpc.nat_ids
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.aws-vpc.natgw_ids
}

output "ec2_public_ip" {
  value = module.aws-ec2.ec2_public_ip
}

output "ec2_private_ip" {
  value = module.aws-ec2.ec2_private_ip
}

output "instance-id" {
  description = "The ID of the instance"
  value       = module.aws-ec2.instance-id
}

output "instance-arn" {
  description = "The ARN of the instance"
  value       = module.aws-ec2.instance-arn
}

output "instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.aws-ec2.instance_state
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.aws-ec2.private_dns
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.aws-ec2.public_dns
}