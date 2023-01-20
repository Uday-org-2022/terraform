resource "aws_instance" "image" {
  ami           = var.ami
  instance_type = var.int-type
  key_name      = var.keypair
  user_data     = file("tomcat.sh")
  tags = {
    "Name" = "image-id"
  }
}

resource "aws_ami_from_instance" "tomcat-ami" {
  name               = "ec2-image"
  source_instance_id = aws_instance.image.id
}