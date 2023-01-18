variable "region" {
	description = "name of the region"
	type = string
	default = "ap-south-1"
}

variable "az1" {
	description = "name of the az1"
	type = string
	default = "ap-south-1a"
}

variable "az2" {
	description = "name of the az2"
	type = string
	default = "ap-south-1c"
}

variable "instance_tenancy" {
	type = string
	default = "default"
}

variable "vpc-cidr" {
	type = string
	default = "192.168.0.0/16"
}

variable "subnet1-cidr" {
	type = string
	default = "192.168.1.0/24"
}

variable "subnet2-cidr" {
	type = string
	default = "192.168.2.0/24"
}

#rds variables
variable "storage" {
	type = number
	default = 20
}

variable "ag_storage" {
	type = number
	default = 50
}

variable "engine" {
	type = string
	default = "postgres"
}

variable "engine_version" {
	type = string
	default = "13.7"
}

variable "identifier" {
	type = string
	default = "db-terraform"
}

variable "port" {
	type = number
	default = "5432"
}

variable "username" {
	type = string
	default = "uday"
}

variable "password" {
	type = string
	default = "uday0286"
}

variable "instance_class" {
	type = string
	default = "db.t3.micro"
}

variable "storage_type" {
	type = string
	default = "gp2"
}

variable "publicly_accessible" {
	type = bool
	default = true
}

variable "snapshot" {
	type = bool
	default = true
}

variable "protection" {
	type = bool
	default = false
}