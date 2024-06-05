variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "subnet_cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

variable "true" {
  type    = bool
  default = true
}