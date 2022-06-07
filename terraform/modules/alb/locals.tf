locals {
  alb_name       = "${var.app}-alb-${terraform.workspace}"
  prefix         = "alb/${var.app}-${terraform.workspace}"
  alb_sg         = "${var.app}-alb-${terraform.workspace}"
  log_bucket     = "${var.app}-alb-access-logs-${terraform.workspace}"
  sg_description = "The security group attached to the ${var.app}-alb-${var.tier} application load balancer"
}
