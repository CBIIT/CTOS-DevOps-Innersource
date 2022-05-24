locals {
  alb_name = "${var.app}-alb-${terraform.workspace}"
  prefix   = "alb/${var.app}-${terraform.workspace}"
  alb_sg   = "${var.app}-alb-${terraform.workspace}"
  log_bucket = "${var.app}-alb-access-logs-${terraform.workspace}"
  sg_description = "The security group attached to the ${var.app}-alb-${var.tier} application load balancer"
  sg_rule_inbound_description = "Defines the https inbound rules for the ${var.app}-sg-${var.tier} application load balancer"
  sg_rule_outbound_description = "Defines all outbound rules for the ${var.app}-sg-${var.tier} application load balancer"
}