output "frontend_repo_arn" {
  value = aws_ecr_repository.frontend.arn
}

output "frontend_registry_id" {
  value = aws_ecr_repository.frontend.registry_id
}

output "frontend_repo_url" {
  value = aws_ecr_repository.frontend.repository_url
}

output "frontend_repo_name" {
  value = aws_ecr_repository.frontend.name
}

output "backend_repo_arn" {
  value = aws_ecr_repository.backend.arn
}

output "backend_registry_id" {
  value = aws_ecr_repository.backend.registry_id
}

output "backend_repo_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "backend_repo_name" {
  value = aws_ecr_repository.backend.name
}

output "backend_api_repo_arn" {
  value = aws_ecr_repository.backend_api.arn
}

output "backend_api_registry_id" {
  value = aws_ecr_repository.backend_api.registry_id
}

output "backend_api_repo_url" {
  value = aws_ecr_repository.backend_api.repository_url
}

output "backend_api_repo_name" {
  value = aws_ecr_repository.backend_api.name
}