output "vpc-id" {
  value = module.vpc.vpc_id
}

output "vpc-arn" {
  value = module.vpc.vpc_arn
}

output "vpc_owner_id" {
  value = module.vpc.vpc_owner_id
}

output "public_subnet" {
  value = module.vpc.public_subnets
}

output "private_subnet" {
  value = module.vpc.private_subnets
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "natgw_id" {
  value = module.vpc.natgw_ids
}

output "eip" {
  value = module.vpc.nat_ids
}

output "security_group_id" {
  value = module.security-group.security_group_id
}

output "security_group_arn" {
  value = module.security-group.security_group_arn
}

output "security_group_vpc_id" {
  value = module.security-group.security_group_vpc_id
}