variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "ami" {
  type    = string
  default = "ami-0e6329e222e662a52"
}

variable "int-type" {
  type    = string
  default = "t2.micro"
}

variable "keypair" {
  type    = string
  default = "sample"
}

variable "az1" {
  description = "name of the az1"
  type        = string
  default     = "ap-south-1a"
}

variable "az2" {
  description = "name of the az2"
  type        = string
  default     = "ap-south-1b"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "vpc-cidr" {
  type    = string
  default = "172.47.0.0/16"
}

variable "subnet1-cidr" {
  type    = string
  default = "172.47.1.0/24"
}

variable "subnet2-cidr" {
  type    = string
  default = "172.47.2.0/24"
}

#targetgroup variables
variable "target_name" {
  type    = string
  default = "application-front"
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "port" {
  type    = number
  default = "8080"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

#loadbalancer
variable "lb_name" {
  type    = string
  default = "tf-lb-test"
}

variable "internal" {
  type    = bool
  default = false

}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "lb_addr" {
  type    = string
  default = "ipv4"

}
