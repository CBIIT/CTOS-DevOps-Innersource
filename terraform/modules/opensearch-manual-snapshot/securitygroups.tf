resource "aws_security_group" "os" {
  name        = local.sg
  description = "OpenSearch SG for ${aws_opensearch_domain.os.domain_name}"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "inbound_vpc" {
  security_group_id = aws_security_group.os.id
  description       = "Allow traffic from within the target VPC"
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
}

resource "aws_security_group_rule" "inbound_jenkins" {
  security_group_id        = aws_security_group.os.id
  description              = "Allow traffic originating from the jenkins instance"
  type                     = "ingress"
  from_port                = 443
  protocol                 = "tcp"
  to_port                  = 443
  source_security_group_id = var.jenkins_security_group_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "self" {
  security_group_id = aws_security_group.os.id
  description       = "Allow traffic between nodes within the cluster"
  type              = "ingress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  self              = true

  lifecycle {
    create_before_destroy = true
  }
}
