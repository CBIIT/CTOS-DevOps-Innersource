locals {
  ecs_cluster_name          = "${var.app}-ecs-${terraform.workspace}"
  ecs_frontend_service_name = "${var.app}-ecs-service-frontend-${terraform.workspace}"
  ecs_backend_service_name  = "${var.app}-ecs-service-backend-${terraform.workspace}"
  ecs_family_frontend       = "${var.app}-ecs-family-frontend-${terraform.workspace}"
  ecs_family_backend        = "${var.app}-ecs-family-backend-${terraform.workspace}"
  ecs_app_sg_name           = "${var.app}-ecs-app-sg-${terraform.workspace}"
  nih_cidrs                 = terraform.workspace == "prod" || terraform.workspace == "stage" ? ["0.0.0.0/0"] : ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
  task_execution_role_name  = "${var.iam_prefix}-${var.app}-ecs-task-exection-role-${terraform.workspace}"
  task_role_name            = "${var.iam_prefix}-${var.app}-ecs-task-role-${terraform.workspace}"
  ecs_policy_name           = "${var.iam_prefix}-${var.app}-ecs-policy-${terraform.workspace}"
  ecs_policy_attachment_name = "${var.iam_prefix}-${var.app}-ecs-policy-attachement-${terraform.workspace}"
  ecs_log_policy            = "${var.iam_prefix}-${var.app}-ecs-log-policy-${terraform.workspace}"
}
