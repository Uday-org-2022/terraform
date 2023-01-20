#Launch configurations
resource "aws_launch_configuration" "as_conf" {
  name            = "terraform-lc-example"
  image_id        = aws_ami_from_instance.tomcat-ami.id
  instance_type   = "t2.micro"
  key_name        = var.keypair
  security_groups = [aws_security_group.sg.id]
}

#Auto scaling group
resource "aws_autoscaling_group" "asg" {
  name                 = "${aws_launch_configuration.as_conf.name}-asg"
  launch_configuration = aws_launch_configuration.as_conf.name
  vpc_zone_identifier  = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  target_group_arns    = [aws_lb_target_group.front.arn]
  health_check_type    = "ELB"
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}

#Registerdtargets
resource "aws_autoscaling_attachment" "asg-targets" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.front.arn
}

resource "aws_autoscaling_policy" "bat" {
  name                   = "foobar3-terraform-test"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
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
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.bat.arn]
}


