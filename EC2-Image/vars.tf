variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "true" {
  type    = bool
  default = true
}

variable "type" {
  type    = string
  default = "ingress"
}

variable "port" {
  type    = number
  default = 80
}

variable "int-type" {
  type    = string
  default = "t2.micro"
}
