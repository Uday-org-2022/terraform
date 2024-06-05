variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami" {
  type    = string
  default = "ami-00fa32593b478ad6e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "security_group_id" {
  type    = string
  default = "sg-03c522caf5d04c6dc"
}