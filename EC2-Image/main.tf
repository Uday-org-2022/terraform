#subnet
data "aws_subnet" "subnet1" {
  filter {
    name   = "tag:Name"
    values = ["default-1"]
  }
}

#amazonlinuximage
data "aws_ami" "amz" {
  most_recent = var.true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

#security-group
data "aws_security_group" "default" {
  name = "default"
}

#create the security group rules
resource "aws_security_group_rule" "security" {
  type              = var.type
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default.id
}

#keypair
data "aws_key_pair" "my_key_pair" {
  key_name = "sample"
}

#EC2-creation
resource "aws_instance" "ami-httpd" {
  ami             = data.aws_ami.amz.id
  instance_type   = var.int-type
  key_name        = data.aws_key_pair.my_key_pair.key_name
  subnet_id       = data.aws_subnet.subnet1.id
  security_groups = [data.aws_security_group.default.id]
  user_data       = file("httpd.sh")
  tags = {
    "Name" = "image-id"
  }
}

resource "aws_ami_from_instance" "name" {
  name               = "httpd-image"
  source_instance_id = aws_instance.ami-httpd.id
  tags = {
    Name = "HTTPD-AMI"
  }

  depends_on = [
    aws_instance.ami-httpd
  ]
}

