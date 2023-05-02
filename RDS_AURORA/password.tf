
resource "random_password" "password1" {
  length           = 16
  special          = var.true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "secret" {
  provider = aws.primary
  name     = "master-dev-db-01"
}

resource "aws_secretsmanager_secret_version" "s" {
  provider      = aws.primary
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = <<EOF
   {
    "username": "${aws_rds_cluster.primary.master_username}",
    "password": "${aws_rds_cluster.primary.master_password}"
   }
EOF
}

resource "aws_kms_key" "default" {
  provider    = aws.secondary
  description = "AWS KMS Key to encrypt Database Activity Stream"
}

resource "aws_rds_cluster_activity_stream" "kms" {
  provider     = aws.secondary
  resource_arn = aws_rds_cluster.secondary.arn
  mode         = "async"
  kms_key_id   = aws_kms_key.default.key_id

  depends_on = [aws_rds_cluster_instance.secondary_instance, aws_rds_cluster.secondary]
}