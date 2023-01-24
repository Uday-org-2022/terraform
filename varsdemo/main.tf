provider "aws" {
  region = "ap-south-1"
}

#force unlock
terraform {
  backend "s3" {
    bucket         = "uudhhay-backend-1"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "state-lock"
    encrypt        = true
  }
}


resource "aws_instance" "EC2-creation" {
  count           = var.instances
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key-pair
  security_groups = ["${var.security}"]
  user_data       = file("installapache.sh")
  tags = {
    Name = "EC2-creation-${count.index}"
  }
}