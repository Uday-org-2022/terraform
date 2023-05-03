variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "ami" {
  type = map(any)

  default = {
    ap-south-1 = "ami-0c768662cc797cd75"
    us-east-1  = "ami-02396cdd13e9a1257"
    us-east-2  = "ami-0578f2b35d0328762"
  }

}

variable "instance_type" {
  type = map(any)

  default = {
    ap-south-1 = "t2.micro"
    us-east-1  = "t2.medium"
    us-east-2  = "t2.large"
  }
}

# lookup(map, key, default)


