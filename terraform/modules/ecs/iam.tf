# we need to move the project specific policy creation outside of module.

resource "aws_iam_role" "task_execution_role" {
  name               = local.task_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.task_execution_policy.json
}

resource "aws_iam_role" "task_role" {
  name               = local.task_role_name
  assume_role_policy = data.aws_iam_policy_document.task_execution_policy.json
}

resource "aws_iam_role_policy_attachment" "task_execution_role_policy_attachment" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_policy" "ecs_log_policy" {
  name   = local.ecs_log_policy
  policy = data.aws_iam_policy_document.task_logs_policy.json
}

resource "aws_iam_role_policy_attachment" "task_log_policy_attachment" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = aws_iam_policy.ecs_log_policy.arn
}