#Vpc creation
resource "aws_vpc" "vpc" {
	cidr_block = var.vpc-cidr
	instance_tenancy = var.instance_tenancy
	enable_dns_support = true
	enable_dns_hostnames = true
	
	tags = {
		Name = "terraform-vpc"
	}
}

#public subnet
resource "aws_subnet" "subnet1" {
	vpc_id = aws_vpc.vpc.id
	cidr_block = var.subnet1-cidr
	availability_zone = var.az1
	
	tags = {
		Name = "subnet-1-tf"
	}
}

#public subnet
resource "aws_subnet" "subnet2" {
	vpc_id = aws_vpc.vpc.id
	cidr_block = var.subnet2-cidr
	availability_zone = var.az2
	
	tags = {
		Name = "subnet-2-tf"
	}
}

#Internet gateway
resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.vpc.id
	
	tags = {
		Name = "terraform-igw"
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
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-rt2"
  }
}

#subnet association 1
resource "aws_route_table_association" "a" {
	subnet_id      = aws_subnet.subnet1.id
	route_table_id = aws_route_table.rt1.id
}

#subnet association 2
resource "aws_route_table_association" "b" {
	subnet_id      = aws_subnet.subnet2.id
	route_table_id = aws_route_table.rt2.id
}
