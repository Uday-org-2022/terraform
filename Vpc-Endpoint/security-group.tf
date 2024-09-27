resource "aws_security_group" "public-sg" {
  name        = var.public_security_tags
  description = "public subnet of the security group"
  vpc_id      = aws_vpc.endpoint-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.public_security_tags
  }
}

resource "aws_security_group" "private-sg" {
  name        = var.private_security_tags
  description = "private subnet of the security group"
  vpc_id      = aws_vpc.endpoint-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.private_security_tags
  }
}

resource "aws_security_group" "main" {
  name        = var.endpoint_security_tags
  description = "main security group"
  vpc_id      = aws_vpc.endpoint-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.endpoint_security_tags
  }
}