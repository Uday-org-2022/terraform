variable "instance_info" {
  type = map(string)
  default = {
    "ami"           = "ami-0e159fc62d940d348"
    "instance-type" = "t2.micro"
    "keypair"       = "uudhhay"
  }
}

variable "vpc-info" {
  type = map(object({
    cidr_block       = string
    instance_tenancy = string
    bool_var         = bool
    vpc_tag            = string
  }))

  default = {
    "VPC1" = {
      cidr_block       = "192.168.0.0/16"
      instance_tenancy = "default"
      bool_var         = true
      tag_name         = "VPC1"
      vpc_tag           = "terraform-vpc1"
    }
    "VPC2" = {
      cidr_block       = "10.10.0.0/16"
      instance_tenancy = "default"
      bool_var         = false
      vpc_tag           = "terraform-vpc2"
    }

  }

}

  
