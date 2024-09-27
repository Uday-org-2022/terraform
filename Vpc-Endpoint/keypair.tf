resource "aws_key_pair" "key-name" {
  for_each = toset(var.keypair_names)

  key_name   = each.key
  public_key = tls_private_key.rsa[each.key].public_key_openssh
}

resource "tls_private_key" "rsa" {
  for_each = toset(var.keypair_names)

  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "key_name" {
  for_each = toset(var.keypair_names)
  content  = tls_private_key.rsa[each.key].private_key_pem
  filename = "D:\\terraform\\Vpc-Endpoint\\keys\\${each.key}.pem"
}