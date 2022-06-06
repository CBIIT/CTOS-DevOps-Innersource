resource "aws_security_group" "app_sg" {
  name   = local.ecs_app_sg_name
  vpc_id = var.vpc_id
  tags = merge(
    {
      "Name" = format("%s-%s-%s", var.app, "app-sg", terraform.workspace)
    },
  var.tags)
}
