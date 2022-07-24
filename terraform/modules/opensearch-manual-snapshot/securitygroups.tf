resource "aws_security_group" "os" {
  name        = local.sg
  description = "OpenSearch SG for ${aws_opensearch_domain.os.domain_name}"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "inbound_alb" {
  count = var.enable_inbound_alb == true ? 1 : 0

  security_group_id        = aws_security_group.os.id
  description              = "Allow traffic originating from the ALB"
  type                     = "ingress"
  from_port                = 443
  protocol                 = "tcp"
  to_port                  = 443
  source_security_group_id = var.alb_sg_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "inbound_app" {
  count = var.enable_inbound_app == true ? 1 : 0

  security_group_id        = aws_security_group.os.id
  description              = "Allow traffic originating from the application compute resources"
  type                     = "ingress"
  from_port                = 443
  protocol                 = "tcp"
  to_port                  = 443
  source_security_group_id = var.app_sg_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "inbound_jenkins" {
  count = var.enable_inbound_jenkins == true ? 1 : 0

  security_group_id        = aws_security_group.os.id
  description              = "Allow traffic originating from the jenkins instance"
  type                     = "ingress"
  from_port                = 443
  protocol                 = "tcp"
  to_port                  = 443
  source_security_group_id = var.app_sg_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "inbound_nih_network" {
  count = var.enable_inbound_nih_network == true ? 1 : 0

  security_group_id = aws_security_group.os.id
  description       = "Allow traffic originating from the NIH network"
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  cidr_blocks       = nih_cidr_blocks
}

resource "aws_security_group_rule" "outbound" {
  security_group_id = aws_security_group.os.id
  description       = "OpenSearch Outbound"
  type              = "egress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = [local.open]
}


