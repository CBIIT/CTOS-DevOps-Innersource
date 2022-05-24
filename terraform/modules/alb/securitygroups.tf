resource "aws_security_group" "alb-sg" {
  name        = local.alb_sg
  description = local.sg_description
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "alb_inbound_https" {
  security_group_id = aws_security_group.alb-sg.id
  description       = local.sg_rule_inbound_description
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  cidr_blocks       = var.alb_inbound_cidr
}

resource "aws_security_group_rule" "alb_outbound_all" {
  security_group_id = aws_security_group.alb-sg.id
  description       = local.sg_rule_outbound_description
  type              = "egress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = var.alb_outbound_cidr
}