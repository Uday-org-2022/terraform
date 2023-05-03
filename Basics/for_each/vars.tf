variable "aws_region" {
  type = string
  default = "ap-south-1"
}

variable "vpcs" {
  type = map(object({
    cidr = string
    tags = map(string)
    tenacy = string
  }))
  default = {
    "app-one" = {
      cidr = "172.44.0.0/16"
      tags = {
        Name = "vpc-one"
      }
      tenacy = "default"
    }
    "app-two" = {
      cidr = "192.168.0.0/16"
      tags = {
        Name = "vpc-two"
      }
      tenacy = "default"
    }
    "app-three" = {
      cidr = "173.91.0.0/16"
      tags = {
        Name = "vpc-three"
      }
      tenacy = "default"
    }
  }
}