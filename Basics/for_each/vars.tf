variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instances" {
  type = map(object({
    ami           = string
    instance_type = string
    tags          = map(string)
  }))

  default = {
    "Instance-1" = {
      instance_type = "t2.micro"
      ami           = "ami-0e159fc62d940d348"
      tags = {
        Name = "Instance 1"
        Env  = "Development"
      }
    }
    "Instance-2" = {
      instance_type = "t2.micro"
      ami           = "ami-05e00961530ae1b55"
      tags = {
        Name = "Instance 2"
        Env  = "Production"
      }
    }
  }
}