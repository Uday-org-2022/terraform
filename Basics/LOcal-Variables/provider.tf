locals {
  region = "ap-south-1"
}

provider "aws" {
  region = local.region
}