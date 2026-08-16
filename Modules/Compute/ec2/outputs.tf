output "instance_id" {
  value = aws_instance.ubuntu.id
}

output "private_ip" {
  value = aws_instance.ubuntu.private_ip
}

output "availability_zone" {
  value = aws_instance.ubuntu.availability_zone
}