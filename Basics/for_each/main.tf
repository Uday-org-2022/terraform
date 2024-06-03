/*
Like the count argument, the for_each meta-argument creates multiple instances of a module or resource block.
However instead of specifying the number of resources, the for_each meta-argument accepts a map or a set of strings.

This is useful when the multiple resources are required that have different values.
Consider our active directory groups example, with each group requiring a different owner.
*/

resource "aws_instance" "main" {
  for_each      = var.instances
  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = "uudhhay"

  tags = each.value.tags
}