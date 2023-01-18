resource "aws_db_instance" "replica1" {
    replicate_source_db = aws_db_instance.db.identifier
    allocated_storage = 30
    max_allocated_storage = 50
    availability_zone = "ap-south-1a"
    engine = "aurora-postgresql"
    engine_version = "13.4"
    identifier = "db-terraform-replica-1"
    port = "5432"
    username = "uday1"
    password = "uday0286"
    instance_class = "db.t3.medium"
    storage_type = "gp2"
    db_subnet_group_name = aws_db_subnet_group.db_subnet.name
    vpc_security_group_ids= [aws_security_group.security.id]
    publicly_accessible = true
    skip_final_snapshot = true
    deletion_protection = true
    backup_retention_period = 0
    apply_immediately  = true
}