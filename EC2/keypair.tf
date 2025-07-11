resource "aws_key_pair" "tf-key-pair" {
  key_name   = var.key-value
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "${var.key-value}.pem"
  file_permission = "0600"
}