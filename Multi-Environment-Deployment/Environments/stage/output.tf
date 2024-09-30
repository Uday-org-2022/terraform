output "VPC_ID" {
  value = module.vpc.vpc_id
}

output "private-subnet-id" {
  value = module.vpc.private_subnets
}

output "public-subnet-id" {
  value = module.vpc.public_subnets
}

output "private-subnet-arns" {
  value = module.vpc.private_subnet_arns
}

output "public-subnet-arns" {
  value = module.vpc.public_subnet_arns
}