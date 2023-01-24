resource "aws_security_group" "security" {
  vpc_id      = aws_vpc.vpc.id
  name        = "rds-security"
  description = "Allow all inbound for Postgres"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}