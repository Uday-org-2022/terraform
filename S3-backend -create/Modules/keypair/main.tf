provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "uudhhay-backend-c7f10e8e"
    key            = "project/keypair/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "state-lock-c7f10e8e"
    encrypt        = true
  }
}
resource "aws_key_pair" "tf-key-pair" {
  key_name   = "${var.environment}-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${var.environment}-key-pair.pem"
}