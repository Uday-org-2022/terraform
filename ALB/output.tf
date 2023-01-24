#datasource
output "image-id1" {
  value = data.aws_instance.image1.id
}

output "ami-id1" {
  value = aws_ami_from_instance.app1.id

}

output "image-id2" {
  value = data.aws_instance.image2.id
}

output "ami-id2" {
  value = aws_ami_from_instance.app2.id

}

#loadbalancer
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

#autoscaling-app1
output "launch_config_id1" {
  description = "The ID of the launch template"
  value       = try(aws_launch_configuration.as_conf1.id, "")
}

output "launch_config_arn1" {
  description = "The ARN of the launch template"
  value       = try(aws_launch_configuration.as_conf1.arn, "")
}

output "launch_config_name1" {
  description = "The name of the launch template"
  value       = try(aws_launch_configuration.as_conf1.name, "")
}

output "autoscaling_group_id1" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.asg1.id
}

output "autoscaling_group_name1" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.asg1.name
}

output "autoscaling_group_arn1" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.asg1.arn
}

output "autoscaling_group_min_size1" {
  description = "The minimum size of the autoscale group"
  value       = aws_autoscaling_group.asg1.min_size
}

output "autoscaling_group_max_size1" {
  description = "The maximum size of the autoscale group"
  value       = aws_autoscaling_group.asg1.max_size
}

output "autoscaling_group_desired_capacity1" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = aws_autoscaling_group.asg1.desired_capacity
}

output "autoscaling_group_default_cooldown1" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = aws_autoscaling_group.asg1.default_cooldown
}

output "autoscaling_group_health_check_grace_period1" {
  description = "Time after instance comes into service before checking health"
  value       = aws_autoscaling_group.asg1.health_check_grace_period
}

output "autoscaling_group_health_check_type1" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = aws_autoscaling_group.asg1.health_check_type
}

output "autoscaling_group_availability_zones1" {
  description = "The availability zones of the autoscale group"
  value       = aws_autoscaling_group.asg1.availability_zones
}

output "autoscaling_group_vpc_zone_identifier1" {
  description = "The VPC zone identifier"
  value       = aws_autoscaling_group.asg1.*.vpc_zone_identifier
}

output "autoscaling_group_enabled_metrics1" {
  description = "List of metrics enabled for collection"
  value       = aws_autoscaling_group.asg1.*.enabled_metrics
}

#autoscaling-app2
output "launch_config_id2" {
  description = "The ID of the launch template"
  value       = try(aws_launch_configuration.as_conf2.id, "")
}

output "launch_config_arn2" {
  description = "The ARN of the launch template"
  value       = try(aws_launch_configuration.as_conf2.arn, "")
}

output "launch_config_name2" {
  description = "The name of the launch template"
  value       = try(aws_launch_configuration.as_conf2.name, "")
}

output "autoscaling_group_id2" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.asg2.id
}

output "autoscaling_group_name2" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.asg2.name
}

output "autoscaling_group_arn2" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.asg2.arn
}

output "autoscaling_group_min_size2" {
  description = "The minimum size of the autoscale group"
  value       = aws_autoscaling_group.asg2.min_size
}

output "autoscaling_group_max_size2" {
  description = "The maximum size of the autoscale group"
  value       = aws_autoscaling_group.asg2.max_size
}

output "autoscaling_group_desired_capacity2" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = aws_autoscaling_group.asg2.desired_capacity
}

output "autoscaling_group_default_cooldown2" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = aws_autoscaling_group.asg2.default_cooldown
}

output "autoscaling_group_health_check_grace_period2" {
  description = "Time after instance comes into service before checking health"
  value       = aws_autoscaling_group.asg2.health_check_grace_period
}

output "autoscaling_group_health_check_type2" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = aws_autoscaling_group.asg2.health_check_type
}

output "autoscaling_group_availability_zones2" {
  description = "The availability zones of the autoscale group"
  value       = aws_autoscaling_group.asg2.availability_zones
}

output "autoscaling_group_vpc_zone_identifier2" {
  description = "The VPC zone identifier"
  value       = aws_autoscaling_group.asg2.*.vpc_zone_identifier
}

output "autoscaling_group_enabled_metrics2" {
  description = "List of metrics enabled for collection"
  value       = aws_autoscaling_group.asg2.*.enabled_metrics
}
