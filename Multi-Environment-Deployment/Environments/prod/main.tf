module "vpc" {
  source       = "D:\\terraform\\Multi-Environment-Deployment\\Modules\\vpc"
  environment  = var.environment
  cidr_block   = var.vpc_cidr
  public-cidr  = var.public_subnet_cidr
  private-cidr = var.private_subnet_cidr
}

module "EC2" {
  source            = "D:\\terraform\\Multi-Environment-Deployment\\Modules\\EC2"
  environment       = var.environment
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  public_subnet_id  = module.vpc.public_subnets
  private_subnet_id = module.vpc.private_subnets
  security_group_id = module.vpc.security_group_id
  env_key_name      = var.environment

  depends_on = [module.vpc]
}