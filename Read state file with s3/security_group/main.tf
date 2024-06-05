resource "aws_security_group" "main" {
  name        = "terraform-sg-1"
  description = "Example security group"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "terraform sg"
  }

}