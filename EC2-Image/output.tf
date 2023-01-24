output "subnet-id" {
  value = data.aws_subnet.subnet1.id
}

output "ami-id" {
  value = data.aws_ami.amz.id
}

output "sg-id" {
  value = data.aws_security_group.default.id

}