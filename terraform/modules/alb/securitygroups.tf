resource "aws_security_group" "alb-sg" {
  name        = local.alb_sg
  description = local.sg_description
  vpc_id      = var.vpc_id
}
