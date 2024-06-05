variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami" {
  type    = string
  default = "ami-0e159fc62d940d348"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}