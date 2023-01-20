#Create a target group
resource "aws_lb_target_group" "front" {
  name        = var.target_name
  target_type = var.target_type
  port        = var.port
  protocol    = var.protocol
  vpc_id      = aws_vpc.vpc.id
  health_check {
    healthy_threshold   = 6
    interval            = 10
    matcher             = 200
    path                = "/"
    timeout             = 5
    unhealthy_threshold = 5
  }
}

#Create the load balancer
resource "aws_lb" "test" {
  name                       = var.lb_name
  internal                   = var.internal
  load_balancer_type         = var.lb_type
  security_groups            = [aws_security_group.sg.id]
  subnets                    = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  ip_address_type            = var.lb_addr
  enable_deletion_protection = false

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
}