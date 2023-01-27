#VpcBlock
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.true
  enable_dns_support   = var.true

  tags = {
    Name = "EKS-CLUSTER-VPC"
  }
}

#PublicSubnet01Block
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.az1
  cidr_block              = var.cidr-pub1
  map_public_ip_on_launch = var.true

  tags = {
    "Name" = "public-subnet-1"
  }
}

#PublicSubnet01Block
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.az2
  cidr_block              = var.cidr-pub2
  map_public_ip_on_launch = var.true

  tags = {
    Name = "public-subnet-2"
  }
}

#PrivateSubnet01Block
resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.az1
  cidr_block              = var.cidr-priv1
  map_public_ip_on_launch = var.false

  tags = {
    Name = "private-subnet-1"
  }
}

#PrivateSubnet02Block
resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.az2
  cidr_block              = var.cidr-priv2
  map_public_ip_on_launch = var.false

  tags = {
    Name = "private-subnet-2"
  }
}

#internetgateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "EKS-CLUSTER-IGW"
  }
}

#EIP1
resource "aws_eip" "eip1" {
  vpc = true

  tags = {
    Name = "EKS_CLUSTER1_EIP"
  }
}

#NATGATEWAY1
resource "aws_nat_gateway" "natigw1" {
  allocation_id     = aws_eip.eip1.id
  subnet_id         = aws_subnet.public1.id
  connectivity_type = "public"

  tags = {
    Name = "EKS_NAT1"
  }
}

#EIP
resource "aws_eip" "eip2" {
  vpc = true

  tags = {
    Name = "EKS_CLUSTER2_EIP"
  }
}

#NATGATEWAY
resource "aws_nat_gateway" "natigw2" {
  allocation_id     = aws_eip.eip2.id
  subnet_id         = aws_subnet.public2.id
  connectivity_type = "public"

  tags = {
    Name = "EKS_NAT1"
  }
}

#Routetable-rt1-public
resource "aws_route_table" "rt1-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "EKS-RT1-PUBLIC"
  }
}

#Routetable-rt2-public
resource "aws_route_table" "rt2-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "EKS-RT2_PUBLIC"
  }
}

#Routetable-rt1-private
resource "aws_route_table" "rt1-private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natigw1.id
  }

  tags = {
    "Name" = "EKS-RT1-PRIVATE"
  }
}

#Routetable-rt2-private
resource "aws_route_table" "rt2-private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natigw2.id
  }

  tags = {
    "Name" = "EKS-RT2_PRIVATE"
  }
}

#subnet association - public1
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rt1-public.id
}

#subnet association - public2
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rt2-public.id
}

#subnet association - private1
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.rt1-private.id
}

#subnet association - private1
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.rt2-private.id
}