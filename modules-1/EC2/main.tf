resource "aws_instance" "EC2" {
	count = var.ec2_count
	ami = var.ami
	instance_type = var.int-type
	subnet_id = element(var.subnet,count.index)
	security_groups = [var.security]
	key_name = var.keypair
	tags = {
		Name = "terraform-${count.index}"
	}
}

