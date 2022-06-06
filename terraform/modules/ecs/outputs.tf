output "task_role_name" {
  value = aws_iam_role.task_role.name
}

output "ecs_securitygroup_id" {
  value = aws_security_group.app_sg.id
}