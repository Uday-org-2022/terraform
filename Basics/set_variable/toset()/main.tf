/*
'toset' function is used to convert a list or a tuple to a set.
Sets are collections of unique elements, meaning any duplicate values in the input list or tuple will be removed.
This function can be particularly useful when you need to ensure that a collection of items does not contain duplicates.
*/

resource "aws_instance" "main" {
  for_each = toset(var.instances)
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  key_name      = "uudhhay"

  tags = {
    "Name" = each.value
  }

}