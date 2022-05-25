resource "aws_lb_listener_certificate" "alb" {
  listener_arn = aws_lb_listener.https.arn 
  certificate_arn = data.aws_acm_certificate.wildcard.arn
}

