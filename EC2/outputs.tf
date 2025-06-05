output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.subraz_intern.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.subraz_intern.public_ip
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.subraz_intern.arn
}
