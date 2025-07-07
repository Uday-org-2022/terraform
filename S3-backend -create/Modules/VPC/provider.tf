provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "uudhhay-backend-c7f10e8e"
    key            = "project/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "state-lock-c7f10e8e"
    encrypt        = true
  }
}