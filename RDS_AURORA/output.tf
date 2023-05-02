#VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value = tolist([aws_vpc.a.id, aws_vpc.b.id])
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = tolist([aws_vpc.a.arn, aws_vpc.b.arn])
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = tolist([aws_vpc.a.default_network_acl_id, aws_vpc.b.default_network_acl_id])
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = tolist([aws_vpc.a.instance_tenancy, aws_vpc.b.instance_tenancy])
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = tolist([aws_vpc.a.enable_dns_support, aws_vpc.b.enable_dns_support])
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = tolist([aws_vpc.a.enable_dns_hostnames, aws_vpc.b.enable_dns_hostnames])
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = tolist([aws_vpc.a.main_route_table_id, aws_vpc.b.main_route_table_id])
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = tolist([aws_vpc.a.owner_id, aws_vpc.b.owner_id])
}


output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = tolist([aws_internet_gateway.igw.id, aws_internet_gateway.igw1.id])
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = tolist([aws_internet_gateway.igw.arn, aws_internet_gateway.igw1.arn])
}

#securitygroup
output "security_group_arn" {
  description = "The ARN of the security group"
  value       = tolist([aws_security_group.db_security.arn, aws_security_group.db_security_secondary.arn])
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = tolist([aws_security_group.db_security.id, aws_security_group.db_security_secondary.id])
}

output "security_group_vpc_id" {
  description = "The VPC ID"
  value       = tolist([aws_security_group.db_security.vpc_id, aws_security_group.db_security_secondary.vpc_id])
}
#primarycluster
output "database_name" {
  value = var.database_name
}

output "cluster_identifier" {
  value = tolist([aws_rds_cluster.primary.cluster_identifier, aws_rds_cluster.secondary.cluster_identifier])
}

output "dbi_resource_ids" {
  value = [concat(
    aws_rds_cluster_instance.primary_instance.*.dbi_resource_id,
    aws_rds_cluster_instance.secondary_instance.*.dbi_resource_id,
  )]
}

output "cluster_resource_id" {
  value = tolist([aws_rds_cluster.primary.cluster_resource_id, aws_rds_cluster.secondary.cluster_resource_id])
}

output "cluster-sg" {
  value = tolist([aws_rds_cluster.primary.vpc_security_group_ids, aws_rds_cluster.secondary.vpc_security_group_ids])
}

output "cluster_endpoint" {
  value = tolist([aws_rds_cluster.primary.endpoint, aws_rds_cluster.secondary.endpoint])
}

output "all_instance_endpoints_list" {
  value = [concat(
    aws_rds_cluster_instance.primary_instance.*.endpoint,
    aws_rds_cluster_instance.secondary_instance.*.endpoint,
  )]
}