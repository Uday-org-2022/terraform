resource "aws_instance" "main" {
  for_each      = var.instance_sets
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  key_name      = "uudhhay"

  tags = {
    "Name" = each.value
  }

}