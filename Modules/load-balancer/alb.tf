resource "aws_lb" "alb" {
  name               = "public-alb-${var.env}"
  internal           = false
  load_balancer_type = "application"

  access_logs {
    bucket  = var.alb_logs_bucket
    prefix  = "alb"
    enabled = true
  }

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name        = "alb-${var.env}"
    Environment = var.env
  }
}

resource "aws_lb_target_group" "app_tg" {
  name        = "app-tg-${var.env}"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "app-tg-${var.env}"
    Environment = var.env
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}