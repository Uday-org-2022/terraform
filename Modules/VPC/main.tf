#create a vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    "Name" = "${var.product}-${var.environment}-vpc"
  }
}

#create the internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.product}-${var.environment}-igw"
  }

  depends_on = [aws_vpc.vpc]
}

#use data source to get the availability_zones
data "aws_availability_zones" "azs" {}

#create the public subnets
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block              = var.public-cidr
  availability_zone       = data.aws_availability_zones.azs.names[0]

  tags = {
    "Name" = "${var.product}-${var.environment}-public-tf"
  }
}

#create the private subnets
resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = false
  cidr_block              = var.private-cidr
  availability_zone       = data.aws_availability_zones.azs.names[1]

  tags = {
    Name = "${var.product}-${var.environment}-private-tf"
  }
}

#Elsatic IP
resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name = "${var.product}-${var.environment}-eip"
  }
}

#natgw
resource "aws_nat_gateway" "natgw" {
  allocation_id     = aws_eip.eip.id
  subnet_id         = aws_subnet.public-subnet.id
  connectivity_type = var.connectivity_type

  tags = {
    Name = "${var.product}-${var.environment}-natgw"
  }
}

#route table 1
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.product}-${var.environment}-terraform-rt1"
  }
}

#route table 2
resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "${var.product}-${var.environment}-terraform-rt2"
  }
}

#subnet association 1
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt1.id
}

#subnet association 2
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.rt2.id
}

