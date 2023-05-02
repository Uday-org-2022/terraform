#security-group-primary

resource "aws_security_group" "db_security" {
  provider    = aws.primary
  name        = var.sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.a.id

  ingress {
    from_port   = var.sg_port
    to_port     = var.sg_port
    protocol    = var.protocol
    cidr_blocks = [var.sg_cidr_block]
  }

}

#security-group-secondary
resource "aws_security_group" "db_security_secondary" {
  provider    = aws.secondary
  name        = var.sg_name_secondary
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.b.id

  ingress {
    from_port   = var.sg_port_secondary
    to_port     = var.sg_port_secondary
    protocol    = var.protocol_seondary
    cidr_blocks = [var.sg_cidr_block_secondary]
  }

  depends_on = [aws_vpc.b]
}

