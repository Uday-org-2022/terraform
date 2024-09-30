output "instance-id" {
  description = "The ID of the instance"
  value       = aws_instance.ec2.*.id
}