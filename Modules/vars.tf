variable "product" {
  type    = string
  default = "sales"
}

variable "environment" {
  type    = string
  default = "testing"
}

variable "cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "tenacy" {
  type    = string
  default = "default"
}

variable "public_subnet" {
  type    = string
  default = "192.168.22.0/24"
}

variable "private_subnet" {
  type    = string
  default = "192.168.34.0/24"
}

variable "connectivity_type" {
  type    = string
  default = "public"
}

variable "security_group_name" {
  type    = string
  default = "sales-testing-group"
}

variable "sg_port" {
  type    = number
  default = 22
}

variable "protocol" {
  type    = string
  default = "tcp"
}
variable "sg_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ami_id" {
  type    = string
  default = "ami-0c768662cc797cd75"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_value" {
  type    = string
  default = "uudhhay"
}