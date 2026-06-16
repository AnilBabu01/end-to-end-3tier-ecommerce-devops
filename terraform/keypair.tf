resource "tls_private_key" "batbazar" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "batbazar" {
  key_name   = "batbazar-key"
  public_key = tls_private_key.batbazar.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.batbazar.private_key_pem
  filename        = "${path.module}/batbazar-key.pem"
  file_permission = "0400"
}