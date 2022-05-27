resource "aws_secretsmanager_secret" "secrets_manager" {
  for_each = var.secrets
  name     = each.key
  description = "Managed by Terraform"
}

resource "aws_secretsmanager_secret_version" "secret" {
  for_each = var.secrets
  secret_id     = each.key
  secret_string = jsonencode(each.value)
  depends_on = [
    aws_secretsmanager_secret.secrets_manager
  ]
}