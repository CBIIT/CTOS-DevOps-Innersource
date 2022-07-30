resource "aws_security_group" "os" {
  name        = local.sg
  description = "OpenSearch SG for ${local.domain}"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "self" {
  security_group_id = aws_security_group.os.id
  description       = "Allow traffic between nodes within the cluster"
  type              = "ingress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  self              = true
}
