output "secret_manager_arn" {
  value = aws_secretsmanager_secret_version.secret.arn
}

output "secret_manager_id" {
  value = aws_secretsmanager_secret_version.secret.id
}

output "secret_manager_version_id" {
  value = aws_secretsmanager_secret_version.secret.version_id
}

