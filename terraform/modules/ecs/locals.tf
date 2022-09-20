locals {
  ecs_cluster_name          = "${var.app}-ecs-${terraform.workspace}"
  ecs_frontend_service_name = "${var.app}-ecs-service-frontend-${terraform.workspace}"
  ecs_backend_service_name  = "${var.app}-ecs-service-backend-${terraform.workspace}"
  ecs_family_frontend       = "${var.app}-ecs-family-frontend-${terraform.workspace}"
  ecs_family_backend        = "${var.app}-ecs-family-backend-${terraform.workspace}"
  ecs_app_sg_name           = "${var.app}-ecs-app-sg-${terraform.workspace}"
  task_execution_role_name  = "${var.iam_prefix}-${var.app}-ecs-task-exection-role-${terraform.workspace}"
  task_role_name            = "${var.iam_prefix}-${var.app}-ecs-task-role-${terraform.workspace}"
  ecs_log_policy            = "${var.iam_prefix}-${var.app}-ecs-log-policy-${terraform.workspace}"
  permission_boundary_arn   = terraform.workspace == "dev" || terraform.workspace == "qa" ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser" : null
}
