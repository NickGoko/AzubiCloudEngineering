output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_type" {
  description = "Instance type of the EC2 instance"
  value       = aws_instance.app_server.instance_type
}

output "availability-zone" {
  description = "Availability zone of the EC2 instance"
  value   = aws_instance.app_server.availability_zone
}