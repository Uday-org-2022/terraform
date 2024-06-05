provider "aws" {
  region = var.aws_region
}

data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = "dev"

  config = {
    bucket         = "backend-terraform-state-file-uuddhay-01"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "state-lock"
  }
}