resource "aws_lb" "alb" {
  name                       = local.alb_name
  internal                   = var.internal
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