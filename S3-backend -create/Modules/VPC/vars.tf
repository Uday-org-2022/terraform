variable "region" {
  description = "name of the region"
  type        = string
}

variable "az1" {
  description = "name of the az1"
  type        = string
}

variable "az2" {
  description = "name of the az2"
  type        = string
}

variable "instance_tenancy" {
  type = string
}

variable "vpc-cidr" {
  type = string
}

variable "private-cidr" {
  type = string
}

variable "public-cidr" {
  type = string
}

variable "Env" {
  type = string

}