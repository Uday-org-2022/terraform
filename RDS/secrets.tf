resource "random_password" "master" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "terraformDB" {
  name = "Masteraccoundb"
}

resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.terraformDB.id
  secret_string = <<EOF
   {
    "username": "${aws_db_instance.db.username}",
    "password": "${aws_db_instance.db.password}"

   }
EOF
}

