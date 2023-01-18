provider "aws" {
	region = var.region
}

data "terraform_remote_state"  "subnet" {
	backend = "s3"
	
	config = {
		bucket = "uudhhay-backend-1"
		key = "terraform.tfstate"
		region = var.region
	}
}

resource "aws_instance" "EC2" {
	count = 1
	ami = var.ami
	instance_type = var.int-type
	subnet_id = data.terraform_remote_state.subnet.outputs.public_subnets
	security_groups = data.terraform_remote_state.subnet.outputs.default_security_group_id
	key_name = var.keypair
	tags = {
		Name = "terraform-${count.index}"
	}
}

