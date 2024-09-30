resource "aws_instance" "ec2" {
  count           = 2
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = element([var.public_subnet_id, var.private_subnet_id], count.index)
  security_groups = [var.security_group_id]
  key_name        = aws_key_pair.tf-key-pair.id

  tags = {
    Name = "${var.environment} - ${count.index + 1}"
  }
}