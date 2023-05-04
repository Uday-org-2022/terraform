resource "aws_security_group" "allow_tls" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = var.sg_port
    to_port     = var.sg_port
    protocol    = var.protocol
    cidr_blocks = [var.sg_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.product}-${var.environment}-sg"
  }
}