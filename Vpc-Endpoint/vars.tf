variable "region" {
  type = string
}

variable "vpc-cidr" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

variable "vpc_tags" {
  type = string
}

variable "true" {
  type = bool
}

variable "false" {
  type = bool
}

variable "availability_zone1" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "public_subnet_tags" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "availability_zone2" {
  type = string
}

variable "private_subnet_tags" {
  type = string
}

variable "igw_tags" {
  type = string
}

variable "public_route_tags" {
  type = string
}

variable "private_route_tags" {
  type = string
}

variable "public_security_tags" {
  type = string
}

variable "private_security_tags" {
  type = string
}

variable "endpoint_security_tags" {
  type = string
}

variable "role_name" {
  type = string
}

variable "policy_access_name" {
  type = string
}

variable "Insance_profile" {
  type = string
}

variable "keypair_names" {
  type = list(string)
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_instance_tags" {
  type = string
}

variable "private_instance_tags" {
  type = string
}

variable "service_name" {
  type = string
}

variable "endpoint-tags1" {
  type = string
}

variable "endpoint-tags2" {
  type = string
}


