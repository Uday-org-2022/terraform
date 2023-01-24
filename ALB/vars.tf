#provider
variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "true" {
  type    = bool
  default = true
}

variable "false" {
  type    = bool
  default = false
}

#VPC
variable "vpc-cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "subnet1-cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "subnet2-cidr" {
  type    = string
  default = "192.168.2.0/24"
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

#securitygroup
variable "sg-name" {
  type    = string
  default = "alb-asg-security"
}

variable "ingress-sg" {
  type    = string
  default = "0.0.0.0/0"

}

#targetgroup
variable "target_name" {
  type    = string
  default = "app1"
}

variable "target_name1" {
  type    = string
  default = "app2"
}
variable "target_type" {
  type    = string
  default = "instance"
}

variable "port" {
  type    = number
  default = "80"
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

#launch-config
variable "int-type" {
  type    = string
  default = "t2.micro"
}

variable "keypair" {
  type    = string
  default = "sample"
}