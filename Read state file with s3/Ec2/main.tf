resource "aws_instance" "Ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups = [data.aws_security_group.sg_id.id]
  key_name        = aws_key_pair.tf-key-pair.id

  tags = {
    "Name" = "instance-asg-01"
  }
}