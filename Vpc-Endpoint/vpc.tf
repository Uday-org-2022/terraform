resource "aws_vpc" "endpoint-vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.true
  enable_dns_support   = var.true

  tags = {
    "Name" = var.vpc_tags
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.endpoint-vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = var.true

  tags = {
    "Name" = var.public_subnet_tags
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.endpoint-vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = var.false

  tags = {
    "Name" = var.private_subnet_tags
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.endpoint-vpc.id

  tags = {
    "Name" = var.igw_tags
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.endpoint-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = var.public_route_tags
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.endpoint-vpc.id

  tags = {
    "Name" = var.private_route_tags
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private-rt.id
}