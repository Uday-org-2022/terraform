/*
List is used to store the multiple values in a single variables.
Similar to an array in other programming languages.
*/

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.true
  enable_dns_support   = var.true

  tags = {
    "Name" = "Terraform-Vpc"
  }
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "subnet" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  tags = {
    Name = "my-subnet-${count.index + 1}"
  }
}

output "count" {
    value = length(var.subnet_cidrs)
}
