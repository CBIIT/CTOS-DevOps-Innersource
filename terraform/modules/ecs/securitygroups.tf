resource "aws_security_group" "app_sg" {
  name   = local.ecs_app_sg_name
  vpc_id = var.vpc_id
  tags = merge(
    {
      "Name" = format("%s-%s-%s", var.app, "app-sg", terraform.workspace)
    },
  var.tags)
}

resource "aws_security_group_rule" "inbound_frontend_alb_http" {
  from_port                = var.frontend_port
  protocol                 = "tcp"
  to_port                  = var.frontend_port
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = var.alb_sg_id
  type                     = "ingress"
}

resource "aws_security_group_rule" "inbound_backend_alb" {
  from_port                = var.backend_port
  protocol                 = "tcp"
  to_port                  = var.backend_port
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = var.alb_sg_id #aws_security_group.alb-sg.id
  type                     = "ingress"
}

resource "aws_security_group_rule" "all_outbound_frontend" {
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = local.nih_cidrs
  security_group_id = aws_security_group.app_sg.id
  type              = "egress"
}

resource "aws_security_group_rule" "additional_outbound_frontend" {
  from_port         = "443"
  protocol          = "tcp"
  to_port           = "443"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_sg.id
  type              = "egress"
  description       = "Allow access to AWS Public Service Endpoints"
}