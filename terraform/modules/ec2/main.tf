data "aws_key_pair" "existing" {
    key_name = "dev-key"
}

resource "aws_instance" "docker_host" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.existing.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name        = var.name
    Environment = var.env
  }
}

