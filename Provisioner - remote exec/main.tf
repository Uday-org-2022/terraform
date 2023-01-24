resource "aws_instance" "web" {
  ami                    = "ami-0e6329e222e662a52"
  instance_type          = "t2.micro"
  key_name               = "docker"
  vpc_security_group_ids = ["${aws_security_group.webSG.id}"]
  tags = {
    Name = "remote-exec-provisioner"
  }
}

resource "null_resource" "remote" {

  connection {
    type        = "ssh"
    host        = aws_instance.web.public_ip
    user        = "ec2-user"
    private_key = file("docker.pem")
  }

  provisioner "file" {
    source      = "httpd.sh"
    destination = "/tmp/httpd.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/httpd.sh",
      "sh /tmp/httpd.sh",
      "cd /tmp",
      "touch f1 f2 f3",
    ]
  }

  depends_on = [aws_instance.web]


}

resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}