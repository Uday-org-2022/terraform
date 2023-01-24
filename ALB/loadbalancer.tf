#Create a target group-app1
resource "aws_lb_target_group" "front" {
  name        = var.target_name
  target_type = var.target_type
  port        = var.port
  protocol    = var.protocol
  vpc_id      = aws_vpc.vpc.id
  health_check {
    healthy_threshold   = 6
    interval            = 60
    matcher             = 200
    path                = "/app1/index.html"
    timeout             = 5
    unhealthy_threshold = 5
  }

  depends_on = [
    data.aws_instance.image1,
    aws_ami_from_instance.app1,
    aws_vpc.vpc,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_internet_gateway.igw,
    aws_security_group.alb-sg
  ]
}

#Create a target group-app2
resource "aws_lb_target_group" "back" {
  name        = var.target_name1
  target_type = var.target_type
  port        = var.port
  protocol    = var.protocol
  vpc_id      = aws_vpc.vpc.id
  health_check {
    healthy_threshold   = 6
    interval            = 60
    matcher             = 200
    path                = "/app2/index.html"
    timeout             = 5
    unhealthy_threshold = 5
  }

  depends_on = [
    data.aws_instance.image2,
    aws_ami_from_instance.app2,
    aws_vpc.vpc,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_internet_gateway.igw,
    aws_security_group.alb-sg
  ]
}
#Create the load balancer
resource "aws_lb" "test" {
  name                       = var.lb_name
  internal                   = var.internal
  load_balancer_type         = var.lb_type
  security_groups            = [aws_security_group.alb-sg.id]
  subnets                    = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  ip_address_type            = var.lb_addr
  enable_deletion_protection = false

  depends_on = [
    aws_lb_target_group.front
  ]

  tags = {
    Environment = "production"
  }
}

#Create a listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front.arn
  }

  depends_on = [
    aws_lb.test
  ]
}

#create a listner-rule-app2
resource "aws_lb_listener_rule" "back_end" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.back.arn
  }

  condition {
    path_pattern {
      values = ["/app2/*"]
    }
  }

  depends_on = [
    aws_lb_listener.front_end
  ]
}