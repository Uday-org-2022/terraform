variable "ami" {
  description = "AMI name"
  default     = "ami-0e6329e222e662a52"
}

variable "instance_type" {
  description = "instance_type"
  default     = "t2.micro"

}

variable "instances" {
  description = "number of instances"
  default     = "2"
}

variable "key-pair" {
  description = "key pair name"
  default     = "docker"
}

variable "security" {
  description = "security group"
  default     = "launch-wizard-6"
}