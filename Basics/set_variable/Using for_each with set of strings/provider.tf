locals {
  region_name = "ap-south-1"
}

provider "aws" {
  region = local.region_name
}