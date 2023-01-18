provider "aws" {
	region = var.region
}

terraform {
	backend "s3" {
		bucket = "uudhhay-backend-1"
		key = "terraform.tfstate"
		region = "ap-south-1"
		dynamodb_table = "state-lock"
		encrypt = true
	}
}