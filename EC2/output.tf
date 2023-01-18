output "ec2_public_ip" {
  value = aws_instance.EC2.*.public_ip
}

output "ec2_private_ip" {
  value = "${aws_instance.EC2.*.private_ip}"
}

output "instance-id" {
  description = "The ID of the instance"
  value       = aws_instance.EC2.*.id
}

output "instance-arn" {
  description = "The ARN of the instance"
  value       = aws_instance.EC2.*.arn
}

output "instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.EC2.*.instance_state
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.EC2.*.private_dns
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.EC2.*.public_dns
}