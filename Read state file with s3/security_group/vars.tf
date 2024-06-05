variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ports" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = {
    "22" = {
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "80" = {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}