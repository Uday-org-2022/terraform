#APP1
#Launch configurations
resource "aws_launch_configuration" "as_conf1" {
  name            = "app1-launch-config"
  image_id        = aws_ami_from_instance.app1.id
  instance_type   = var.int-type
  key_name        = var.keypair
  security_groups = [aws_security_group.alb-sg.id]
}

#Auto scaling group
resource "aws_autoscaling_group" "asg1" {
  name                 = "${aws_launch_configuration.as_conf1.name}-asg"
  launch_configuration = aws_launch_configuration.as_conf1.name
  vpc_zone_identifier  = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  target_group_arns    = [aws_lb_target_group.front.arn]
  health_check_type    = "ELB"
  min_size             = 1
  max_size             = 5
  desired_capacity     = 1
  tag {
    key                 = "Name"
    value               = "app1-asg-example"
    propagate_at_launch = true
  }

  depends_on = [
    aws_lb_target_group.front,
    aws_launch_configuration.as_conf1
  ]
}

#Registerdtargets
resource "aws_autoscaling_attachment" "asg-targets1" {
  autoscaling_group_name = aws_autoscaling_group.asg1.id
  lb_target_group_arn    = aws_lb_target_group.front.arn
}

resource "aws_autoscaling_policy" "bat" {
  name                   = "foobar3-terraform-test"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg1.name
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down" {
  alarm_name          = "web_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "50"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg1.name
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.bat.arn]
}

#APP2
#Launch configurations
resource "aws_launch_configuration" "as_conf2" {
  name            = "app2-launch-config"
  image_id        = aws_ami_from_instance.app2.id
  instance_type   = var.int-type
  key_name        = var.keypair
  security_groups = [aws_security_group.alb-sg.id]
}

#Auto scaling group
resource "aws_autoscaling_group" "asg2" {
  name                 = "${aws_launch_configuration.as_conf2.name}-asg"
  launch_configuration = aws_launch_configuration.as_conf2.name
  vpc_zone_identifier  = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  target_group_arns    = [aws_lb_target_group.back.arn]
  health_check_type    = "ELB"
  min_size             = 1
  max_size             = 5
  desired_capacity     = 1
  tag {
    key                 = "Name"
    value               = "app2-asg-example"
    propagate_at_launch = true
  }

  depends_on = [
    aws_lb_target_group.back,
    aws_launch_configuration.as_conf2
  ]
}

#Registerdtargets
resource "aws_autoscaling_attachment" "asg-targets2" {
  autoscaling_group_name = aws_autoscaling_group.asg2.id
  lb_target_group_arn    = aws_lb_target_group.back.arn
}

resource "aws_autoscaling_policy" "bowl" {
  name                   = "foobar4-terraform-test"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg2.name
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down1" {
  alarm_name          = "web_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "50"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg2.name
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.bowl.arn]
}