#creating ecs security group:

resource "aws_security_group" "app_sg" {
  name   = local.ecs_app_sg_name
  vpc_id = var.vpc_id
  tags = merge(
  {
    "Name" = format("%s-%s-frontend-sg", var.app, terraform.workspace),
  },
  var.tags,
  )
}

resource "aws_security_group_rule" "inbound_frontend_alb_http" {
  from_port                = local.frontend_port
  protocol                 = local.tcp_protocol
  to_port                  = local.frontend_port
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = var.alb_sg_id
  type                     = "ingress"
}

resource "aws_security_group_rule" "inbound_backend_alb" {
  from_port                = local.backend_port
  protocol                 = local.tcp_protocol
  to_port                  = local.backend_port
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = var.alb_sg_id #aws_security_group.alb-sg.id
  type                     = "ingress"
}

resource "aws_security_group_rule" "all_outbound_frontend" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  to_port           = local.any_port
  cidr_blocks       = local.nih_cidrs
  security_group_id = aws_security_group.app_sg.id
  type              = "egress"
}

resource "aws_security_group_rule" "additional_outbound_frontend" {
  from_port         = local.https_port
  protocol          = local.tcp_protocol
  to_port           = local.https_port
  cidr_blocks       = local.all_ips
  security_group_id = aws_security_group.app_sg.id
  type              = "egress"
  description       = "Allow access to AWS Public Service Endpoints"
}