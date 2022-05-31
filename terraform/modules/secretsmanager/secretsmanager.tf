resource "aws_secretsmanager_secret" "secrets_manager" {
  name        = local.secret_manager_name
  description = "Managed by Terraform"
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.secrets_manager.id
  secret_string = jsonencode(var.secrets)
  depends_on = [
    aws_secretsmanager_secret.secrets_manager
  ]
}