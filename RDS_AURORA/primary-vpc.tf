#vpc creation
resource "aws_vpc" "a" {
  provider             = aws.primary
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.true
  enable_dns_hostnames = var.true

  tags = {
    Name = "Terraform-db"
  }
}

#public subnet
resource "aws_subnet" "sub1" {
  provider          = aws.primary
  vpc_id            = aws_vpc.a.id
  cidr_block        = var.subnet1_cidr
  availability_zone = var.az1
  tags = {
    "Name" = "subnet1-db-tf"
  }
}

#public subnet
resource "aws_subnet" "sub2" {
  provider          = aws.primary
  vpc_id            = aws_vpc.a.id
  cidr_block        = var.subnet2_cidr
  availability_zone = var.az2
  tags = {
    "Name" = "subnet2-db-tf"
  }
}

#internetgateway
resource "aws_internet_gateway" "igw" {
  provider = aws.primary
  vpc_id   = aws_vpc.a.id

  tags = {
    "Name" = "terraform-db-igw"
  }
}

#routetabel1
resource "aws_route_table" "rt1" {
  provider = aws.primary
  vpc_id   = aws_vpc.a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "terraform-db-rt1"
  }
}

#routetable2
resource "aws_route_table" "rt2" {
  provider = aws.primary
  vpc_id   = aws_vpc.a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "terraform-db-rt2"
  }
}

#subnetassociation1
resource "aws_route_table_association" "rtb1" {
  provider       = aws.primary
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt1.id
}

##subnetassociation2
resource "aws_route_table_association" "rtb2" {
  provider       = aws.primary
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.rt2.id
}