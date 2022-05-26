resource "aws_lb" "alb" {
  name                       = local.alb_name
  internal                   = local.internal
  load_balancer_type         = var.type
  drop_invalid_header_fields = var.drop_invalid_header
  enable_deletion_protection = var.enable_deletion_protection
  security_groups            = [aws_security_group.alb-sg.id]
  subnets                    = var.subnets

  access_logs {
    bucket  = aws_s3_bucket.logs.bucket
    prefix  = local.prefix
    enabled = true
  }

  timeouts {
    create = var.create_timeout
  }

}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = var.listener_ssl_policy

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This resource is not available"
      status_code  = "200"
    }
  }
}