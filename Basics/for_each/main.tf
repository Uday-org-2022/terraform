provider "aws" {
    region = var.aws_region
}

resource "aws_vpc" "vpc" {
  for_each = var.vpcs
  cidr_block = each.value["cidr"]
  instance_tenancy = each.value["tenacy"]

  tags = each.value["tags"]
}