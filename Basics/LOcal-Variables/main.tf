/*
Local variables are declared using the locals block. 
It is a group of key-value pairs that can be used in the configuraration.
The values can be hard-coded or be a reference to another variable or resource.

Local variables are accessible with in the module/configuration where they are declared.

*/
locals {
  cidr-block = "192.168.0.0/16"
  tenacy     = "default"
  bool-true  = var.true-variable

  tags = {
    Name = "My-local-vpc"
    Env  = "Dev"
  }
}

resource "aws_vpc" "main" {
  cidr_block           = local.cidr-block
  instance_tenancy     = local.tenacy
  enable_dns_support   = local.bool-true
  enable_dns_hostnames = local.bool-true

  tags = local.tags
}

resource "aws_vpc" "name" {
  cidr_block = local.cidr-block

}