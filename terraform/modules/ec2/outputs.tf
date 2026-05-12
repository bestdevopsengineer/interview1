output "instance_id" {
  value = aws_instance.docker_host.id
}

output "public_ip" {
  value = aws_instance.docker_host.public_ip
}

output "private_ip" {
  value = aws_instance.docker_host.private_ip
}