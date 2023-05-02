#vpc creation
resource "aws_vpc" "b" {
  provider             = aws.secondary
  cidr_block           = var.cidr_block_secondary
  instance_tenancy     = var.instance_tenancy_secondary
  enable_dns_support   = var.true
  enable_dns_hostnames = var.true

  tags = {
    Name = "Terraform-db-us-east"
  }
}

#public subnet
resource "aws_subnet" "sub3" {
  provider          = aws.secondary
  vpc_id            = aws_vpc.b.id
  cidr_block        = var.subnet3_cidr
  availability_zone = var.az3
  tags = {
    "Name" = "subnet3-db-tf"
  }
}

#public subnet
resource "aws_subnet" "sub4" {
  provider          = aws.secondary
  vpc_id            = aws_vpc.b.id
  cidr_block        = var.subnet4_cidr
  availability_zone = var.az4
  tags = {
    "Name" = "subnet4-db-tf"
  }
}

#internetgateway
resource "aws_internet_gateway" "igw1" {
  provider = aws.secondary
  vpc_id   = aws_vpc.b.id

  tags = {
    "Name" = "terraform-db-igw1"
  }
}

#routetabel1
resource "aws_route_table" "rt1-secondary" {
  provider = aws.secondary
  vpc_id   = aws_vpc.b.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  tags = {
    "Name" = "terraform-db-rt1-secondary"
  }
}

#routetable2
resource "aws_route_table" "rt2-secondary" {
  provider = aws.secondary
  vpc_id   = aws_vpc.b.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  tags = {
    "Name" = "terraform-db-rt2-secondary"
  }
}

#subnetassociation1
resource "aws_route_table_association" "rtb1-secondary" {
  provider       = aws.secondary
  subnet_id      = aws_subnet.sub3.id
  route_table_id = aws_route_table.rt1-secondary.id
}

##subnetassociation2
resource "aws_route_table_association" "rtb2-secondary" {
  provider       = aws.secondary
  subnet_id      = aws_subnet.sub4.id
  route_table_id = aws_route_table.rt2-secondary.id
}