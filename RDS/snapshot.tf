resource "aws_db_snapshot" "snapshot" {
    db_instance_identifier = aws_db_instance.db.id
    db_snapshot_identifier = "snapshot123"
}