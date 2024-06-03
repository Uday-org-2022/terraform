/*
The Tuple variables allows you to define a ordered collection of elements.
For example, we can define the network_addresses variable as a tuple of two strings.

variable "network_addresses" {
  type	= tuple([string, string])
  default = ["192.168.1.1", "192.168.1.2"]
}

Both List and Tuples are used to store the collections of data, but there is key difference between them.
Tuples are immutable, which means they cnnot be changed once created.
You cannot add, remove or modify elements in a tuple.
Whereas Lists are immutable, which means you can add, remove or modify elements in a List.
*/

resource "aws_vpc" "main" {
  cidr_block           = var.tuple_vars[0]
  instance_tenancy     = var.tuple_vars[1]
  enable_dns_hostnames = var.tuple_vars[2]
  enable_dns_support   = var.tuple_vars[2]

  tags = {
    "Name" = "Tuple-vpc"
  }
}