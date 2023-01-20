variable "region" {
  description = "name of the region"
  type        = string
  default     = "ap-south-1"
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
  default = "192.168.0.0/16"
}

variable "private-cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "public-cidr" {
  type    = string
  default = "192.168.2.0/24"
}

variable "ingress-cidr" {
  type    = string
  default = "0.0.0.0/0"
}