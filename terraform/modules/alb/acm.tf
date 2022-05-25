resource "aws_lb_listener_certificate" "alb" {
  count = var.use_wildcard_cert == true ? 1 : 0
  
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = data.aws_acm_certificate.wildcard.arn
}

