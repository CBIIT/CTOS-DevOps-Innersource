resource "aws_security_group" "opensearch" {
  name        = "${var.app}-opensearch-${terraform.workspace}"
  description = "${var.app} security group (${terraform.workspace} tier)"
  vpc_id      = var.vpc_id
}

# NEED TO ADD SECURITY GROUP RULES!