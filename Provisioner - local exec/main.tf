provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-0e6329e222e662a52"
  instance_type = "t2.micro"
  tags = {
    Name = "local-exec-provisioner"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip}, ${self.public_ip} >> private_and_public_ips.txt"
  }

}