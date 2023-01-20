output "lb_id" {
  description = "The ID and ARN of the load balancer we created"
  value       = aws_lb.test.id
}

output "lb_arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = try(aws_lb.test.arn, "")
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = try(aws_lb.test.dns_name, "")
}

output "lb_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch"
  value       = try(aws_lb.test.arn_suffix, "")
}

output "lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = try(aws_lb.test.zone_id, "")
}

output "http_tcp_listener_arns" {
  description = "The ARN of the TCP and HTTP load balancer listeners created"
  value       = aws_lb_listener.front_end.arn
}

output "http_tcp_listener_ids" {
  description = "The IDs of the TCP and HTTP load balancer listeners created"
  value       = aws_lb_listener.front_end.id
}

output "https_listener_arns" {
  description = "The ARNs of the HTTPS load balancer listeners created"
  value       = aws_lb_listener.front_end.arn
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group"
  value       = aws_lb_target_group.front.arn
}


output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group"
  value       = aws_lb_target_group.front[*].name
}

#autoscaling
output "launch_config_id" {
  description = "The ID of the launch template"
  value       = try(aws_launch_configuration.as_conf.id, "")
}

output "launch_config_arn" {
  description = "The ARN of the launch template"
  value       = try(aws_launch_configuration.as_conf.arn, "")
}

output "launch_config_name" {
  description = "The name of the launch template"
  value       = try(aws_launch_configuration.as_conf.name, "")
}

output "autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.asg.id
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.asg.name
}

output "autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.asg.arn
}

output "autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = aws_autoscaling_group.asg.min_size
}

output "autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       =  aws_autoscaling_group.asg.max_size
}

output "autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = aws_autoscaling_group.asg.desired_capacity
}

output "autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = aws_autoscaling_group.asg.default_cooldown
}

output "autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = aws_autoscaling_group.asg.health_check_grace_period
}

output "autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = aws_autoscaling_group.asg.health_check_type
}

output "autoscaling_group_availability_zones" {
  description = "The availability zones of the autoscale group"
  value       = aws_autoscaling_group.asg.availability_zones
}

output "autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = aws_autoscaling_group.asg.*.vpc_zone_identifier
}

output "autoscaling_group_enabled_metrics" {
  description = "List of metrics enabled for collection"
  value       = aws_autoscaling_group.asg.*.enabled_metrics
}
