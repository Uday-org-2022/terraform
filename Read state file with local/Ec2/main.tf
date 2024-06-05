data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "E:\\terraform\\Read state file with local\\common-resource\\terraform.tfstate"
  }
}

resource "aws_instance" "EC2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  security_groups             = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true
  key_name                    = "uudhhay"

  tags = {
    "Name" = "uudhhay"
  }
}