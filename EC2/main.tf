provider "aws" {
  region = var.region
}

resource "aws_instance" "EC2" {

  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public,
    aws_subnet.private,
    aws_security_group.sg,
    aws_key_pair.tf-key-pair,
    tls_private_key.rsa,
    local_file.tf-key
  ]

  count         = var.ec2_count
  ami           = var.ami
  instance_type = var.int-type
  #subnet_id = element(var.subnet,count.index)
  subnet_id       = element([aws_subnet.public.id, aws_subnet.private.id], count.index)
  security_groups = [aws_security_group.sg.id]
  key_name        = aws_key_pair.tf-key-pair.id
  user_data       = file("install.sh")
  tags = {
    Name = "terraform-${count.index}"
  }
}

