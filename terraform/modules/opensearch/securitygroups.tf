resource "aws_security_group" "opensearch" {
  name   = local.sg
  vpc_id = var.vpc_id
}
