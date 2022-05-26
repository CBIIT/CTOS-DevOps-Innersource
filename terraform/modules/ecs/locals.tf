locals {
  ecs_cluster_name          = "${var.app}-ecs-${terraform.workspace}"
  ecs_frontend_service_name = "${var.app}-ecs-${terraform.workspace}-frontend"
  ecs_backend_service_name  = "${var.app}-ecs-${terraform.workspace}-backend"
  ecs_family_frontend       = "${var.app}-ecs-${terraform.workspace}-frontend"
  ecs_family_backend        = "${var.app}-ecs-${terraform.workspace}-backend"
  ecs_app_sg_name           = "${var.app}-ecs-${terraform.workspace}-app-sg"
  tcp_protocol              = "tcp"
  any_port                  = 0
  any_protocol              = "-1"
  https_port                = "443"
  nih_cidrs                 = terraform.workspace == "prod" || terraform.workspace == "stage" ? ["0.0.0.0/0"] : ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
  all_ips                   = ["0.0.0.0/0"]
  frontend_port             = 80
  backend_port              = 8080
  task_execution_role_name  = "${var.iam_prefix}-${var.app}-ecs-${terraform.workspace}-task-exection-role"
  task_role_name            = "${var.iam_prefix}-${var.app}-ecs-${terraform.workspace}-task-role"
  ecs_policy_name           = "${var.iam_prefix}-${var.app}-ecs-${terraform.workspace}-ecs-policy"
  ecs_policy_attachment_name = "${var.iam_prefix}-${var.app}-ecs-${terraform.workspace}-ecs-policy-attachement"
  ecs_log_policy            = "${var.iam_prefix}-${var.app}-ecs-${terraform.workspace}-ecs-log-policy"
}
