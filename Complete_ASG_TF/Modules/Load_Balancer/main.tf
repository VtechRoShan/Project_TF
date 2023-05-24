# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet_az1_id, var.public_subnet_az2_id]
  enable_deletion_protection = false

  tags   = {
    Name = "${var.project_name}-alb"
  }
}

# create target group 1
resource "aws_lb_target_group" "alb_target_group_i" {
  name        = "${var.project_name}-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener_i" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group_i.arn
  }
}

resource "aws_lb_target_group_attachment" "instance_attach_i" {
  target_group_arn = aws_lb_target_group.alb_target_group_i.arn
  target_id        = var.instance_az_i_id
  port             = 80
}



# create target group 2
resource "aws_lb_target_group" "alb_target_group_ii" {
  name        = "${var.project_name}-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener_ii" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group_ii.arn
  }
}

resource "aws_lb_target_group_attachment" "instance_attach_ii" {
  target_group_arn = aws_lb_target_group.alb_target_group_ii.arn
  target_id        = var.instance_az_ii_id
  port             = 80
}
