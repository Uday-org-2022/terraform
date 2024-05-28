/*
A map variable is a collection of key-value pairs.
This can be useful for passing structured set of values to your configuration.

variable "example_map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}
*/

resource "aws_instance" "Ec2_instance1" {
  ami           = var.instance_info["ami"]
  instance_type = var.instance_info["instance-type"]
  key_name      = var.instance_info["keypair"]

  tags = {
    "Name" = "Ec2-instance-1"
  }

}

resource "aws_vpc" "vpc" {

  for_each             = var.vpc-info
  cidr_block           = each.value.cidr_block
  instance_tenancy     = each.value.instance_tenancy
  enable_dns_support   = each.value.bool_var
  enable_dns_hostnames = each.value.bool_var

  tags = {
    "Name" = each.value.vpc_tag
  }

}