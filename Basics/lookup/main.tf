provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = lookup(var.ami, var.aws_region)
  instance_type = lookup(var.instance_type, var.aws_region)

  tags = {
    "Name" = "default"
  }
}