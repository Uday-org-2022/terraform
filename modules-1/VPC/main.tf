#Vpc creation
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc"
  }
}

#public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public-cidr
  availability_zone = var.az1

  tags = {
    Name = "public-tf"
  }
}

#private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-cidr
  availability_zone = var.az2

  tags = {
    Name = "private-tf"
  }
}

#Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

#Elastic-ip
resource "aws_eip" "elastic-ip" {
  vpc = true
}

#nat gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.private.id

  tags = {
    Name = "terraform-nat"
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
    Name = "terraform-rt1"
  }
}

#route table 2
resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "terraform-rt2"
  }
}

#subnet association 1
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt1.id
}

#subnet association 2
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.rt2.id
}

#Security Group
resource "aws_security_group" "sg" {
  name        = "vpc-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-sg"
  }
}