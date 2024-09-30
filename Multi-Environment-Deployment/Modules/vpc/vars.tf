variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "true" {
  type    = bool
  default = true
}

variable "false" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
}

variable "az1" {
  type    = string
  default = "ap-south-1a"
}

variable "az2" {
  type    = string
  default = "ap-south-1b"
}

variable "public-cidr" {
  type = string
}

variable "private-cidr" {
  type = string
}

