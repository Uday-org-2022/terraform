#primary-db-variables
variable "true" {
  type    = bool
  default = true
}

variable "false" {
  type    = string
  default = false
}

#vpc
variable "cidr_block" {
  type    = string
  default = "172.48.0.0/16"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "subnet1_cidr" {
  type    = string
  default = "172.48.1.0/24"
}

variable "subnet2_cidr" {
  type    = string
  default = "172.48.2.0/24"
}

variable "az1" {
  type    = string
  default = "ap-south-1a"
}

variable "az2" {
  type    = string
  default = "ap-south-1b"
}

#security_group
variable "sg_name" {
  type    = string
  default = "db-security"
}

variable "sg_port" {
  type    = number
  default = 5432
}

variable "sg_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "protocol" {
  type    = string
  default = "tcp"
}

#subnetgroup
variable "subnet_group_name" {
  type    = string
  default = "auorora db subnet group"
}

#parameter group

variable "parameter-group-name" {
  type    = string
  default = "postgresql-13"
}

variable "family" {
  type    = string
  default = "aurora-postgresql13"
}

variable "cluster_parameters" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))

  default     = []
  description = "List of DB instance parameters to apply"
}

#rds-cluster
variable "int_count" {
  type    = number
  default = 1
}

variable "cluster_identifier" {
  type    = string
  default = "master-db-01-dev"
}

variable "database_name" {
  type    = string
  default = "masterdb"
}

variable "username" {
  type    = string
  default = "admin123"
}

variable "engine" {
  type    = string
  default = "aurora-postgresql"
}

variable "engine_mode" {
  type    = string
  default = "provisioned"
}

variable "engine_version" {
  type    = string
  default = "13.6"
}

variable "instance_class" {
  type    = string
  default = "db.r5.large"
}

variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "global_cluster_identifier" {
  type    = string
  default = "global-db-dev"
}

variable "identifier" {
  type    = string
  default = "primary-instance1"
}

#secondary-db-variables

#vpc creation
variable "cidr_block_secondary" {
  type    = string
  default = "192.168.0.0/16"
}

variable "instance_tenancy_secondary" {
  type    = string
  default = "default"
}

variable "subnet3_cidr" {
  type    = string
  default = "192.168.23.0/24"
}

variable "subnet4_cidr" {
  type    = string
  default = "192.168.27.0/24"
}

variable "az3" {
  type    = string
  default = "us-east-1a"
}

variable "az4" {
  type    = string
  default = "us-east-1b"
}

#security-group
variable "sg_name_secondary" {
  type    = string
  default = "db-security-us-east"
}

variable "sg_port_secondary" {
  type    = number
  default = 5432
}

variable "protocol_seondary" {
  type    = string
  default = "tcp"
}

variable "sg_cidr_block_secondary" {
  type    = string
  default = "0.0.0.0/0"
}

#subnet group

variable "subnet_group_name_secondary" {
  type    = string
  default = "aurora db subnet group 1"
}

variable "parameter-group-name-secondary" {
  type    = string
  default = "postgresql-13"
}

variable "family-secondary" {
  type    = string
  default = "aurora-postgresql13"
}

variable "cluster_parameters_secondary" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))

  default     = []
  description = "List of DB instance parameters to apply"
}

#rds-cluster
variable "cluster_identifier_secondary" {
  type    = string
  default = "master-db-02-dev"
}

variable "database_name_secondary" {
  type    = string
  default = "masterdb1"
}

variable "username1" {
  type    = string
  default = "admin1234"
}

variable "identifier-secondary" {
  type    = string
  default = "secondary-instance2"
}