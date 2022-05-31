resource "aws_security_group" "opensearch" {
  name   = local.sg
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "opensearch_inbound_https" {
  security_group_id = aws_security_group.opensearch.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
}
