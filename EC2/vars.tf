
variable "ec2_count" {
  type    = number
  default = "2"
}

variable "ami" {
  type    = string
  default = "ami-0e6329e222e662a52"
}

variable "int-type" {
  type    = string
  default = "t2.micro"
}

#variable "subnet" {
#  type    = list(any)
#  default = ["subnet-04ecb318f944d9dc6", "subnet-0df09e82f2d599d06"]
#}

variable "security" {
  type    = string
  default = "sg-062c1a525ac71b986"
}

variable "keypair" {
  type    = string
  default = "sample"
}
