data "aws_key_pair" "existing" {
    key_name = "dev-key"
}

resource "aws_instance" "docker_host" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.existing.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y docker
  systemctl enable docker
  systemctl start docker
  usermod -aG docker ec2-user
  EOF
  tags = {
    Name        = var.name
    Environment = var.env
  }
}

