resource "aws_instance" "public_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public-sg.id]
  key_name        = var.keypair_names[0]

  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = var.true
  }

  tags = {
    "Name" = var.public_instance_tags
  }

  depends_on = [aws_vpc.endpoint-vpc, aws_security_group.main,
    aws_security_group.private-sg, aws_security_group.public-sg,
    aws_key_pair.key-name, aws_iam_role.s3_access_role,
    aws_vpc_endpoint.Interface-endpoint
  ]
}

resource "aws_instance" "private_instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.private_subnet.id
  security_groups      = [aws_security_group.private-sg.id]
  key_name             = var.keypair_names[1]
  iam_instance_profile = aws_iam_instance_profile.s3_access_with_ec2.id

  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = var.true
  }

  tags = {
    "Name" = var.private_instance_tags
  }
}