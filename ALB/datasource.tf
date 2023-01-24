#app1
data "aws_instance" "image1" {

  filter {
    name   = "tag:Name"
    values = ["app1"]
  }

}

resource "aws_ami_from_instance" "app1" {
  name               = "app1"
  source_instance_id = data.aws_instance.image1.id

  depends_on = [
    data.aws_instance.image1
  ]
  tags = {
    Name = "app1"
  }
}

#app2
data "aws_instance" "image2" {

  filter {
    name   = "tag:Name"
    values = ["app2"]
  }

}

resource "aws_ami_from_instance" "app2" {
  name               = "app2"
  source_instance_id = data.aws_instance.image2.id

  depends_on = [
    data.aws_instance.image2
  ]
  tags = {
    Name = "app2"
  }
}