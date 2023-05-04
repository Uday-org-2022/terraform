provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source               = "E:/terraform/Modules/VPC"
  product              = var.product
  environment          = var.environment
  vpc_cidr             = var.cidr_block
  instance_tenancy     = var.tenacy
  enable_dns_hostnames = true
  enable_dns_support   = true
  public-cidr          = var.public_subnet
  private-cidr         = var.private_subnet
  connectivity_type    = var.connectivity_type
}

module "security-group" {
  source              = "E:/terraform/Modules/Security-group"
  product             = var.product
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.security_group_name
  sg_port             = var.sg_port
  sg_cidr             = var.sg_cidr
  protocol            = var.protocol

  depends_on = [module.vpc]
}

module "ec2" {
  source            = "E:/terraform/Modules/EC2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  public_subnet_id  = module.vpc.public_subnets
  private_subnet_id = module.vpc.private_subnets
  security_group_id = module.security-group.security_group_id
  key_value          = var.key_value

  depends_on = [ module.security-group, module.vpc ]
}