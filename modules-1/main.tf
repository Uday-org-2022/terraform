module "aws-ec2" {
  source = "./EC2"
}

module "aws-vpc" {
  source = "./VPC"
}