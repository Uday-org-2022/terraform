resource "aws_db_subnet_group" "db_subnet" {
  name = "main"

  subnet_ids = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage      = var.storage
  max_allocated_storage  = var.ag_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  identifier             = var.identifier
  port                   = var.port
  username               = var.username
  password               = random_password.master.result
  instance_class         = var.instance_class
  storage_type           = var.storage_type
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.security.id]
  publicly_accessible    = var.publicly_accessible
  skip_final_snapshot    = var.snapshot
  deletion_protection    = var.protection #deletion_protection = true
}