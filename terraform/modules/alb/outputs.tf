output "securitygroup_id" {
  value = aws_security_group.alb-sg.id
}

output "securitygroup_arn" {
  value = aws_security_group.alb-sg.arn
}

output "alb_id" {
  value = aws_lb.alb.id
}

output "alb_arn" {
  value = aws_lb.alb.arn
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "listener_http_id" {
  value = aws_lb_listener.http.id
}

output "listener_http_arn" {
  value = aws_lb_listener.http.arn
}

output "listener_https_id" {
  value = aws_lb_listener.https.id
}

output "listener_https_arn" {
  value = aws_lb_listener.https.arn
}

output "wildcard_cert_domain" {
  value = data.aws_acm_certificate.wildcard.domain
}

output "s3_logs_arn" {
  value = aws_s3_bucket.logs.arn
}