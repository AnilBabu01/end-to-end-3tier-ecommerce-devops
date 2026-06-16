resource "aws_instance" "batbazar" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type

  key_name = aws_key_pair.batbazar.key_name

  vpc_security_group_ids = [
    aws_security_group.devops_sg.id
  ]

  tags = {
    Name = "batbazar-server"
  }
}