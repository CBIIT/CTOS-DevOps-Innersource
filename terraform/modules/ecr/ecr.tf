resource "aws_ecr_repository" "frontend" {
  name                 = local.frontend_repository_name
  image_tag_mutability = var.mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}

resource "aws_ecr_lifecycle_policy" "frontend_ecr_lifecycle_policy" {
  repository = aws_ecr_repository.frontend.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep the last 15 images"

      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 15
      }

      action = {
        type = "expire"
      }
    }]
  })
}

resource "aws_ecr_repository" "backend" {
  name                 = local.backend_repository_name
  image_tag_mutability = var.mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}

resource "aws_ecr_lifecycle_policy" "backend_ecr_lifecycle_policy" {
  repository = aws_ecr_repository.backend.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep the last 15 images"

      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 15
      }

      action = {
        type = "expire"
      }
    }]
  })
}

resource "aws_ecr_repository" "backend_api" {
  name                 = local.backend_api_repository_name
  image_tag_mutability = var.mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}

resource "aws_ecr_lifecycle_policy" "backend_api_ecr_lifecycle_policy" {
  repository = aws_ecr_repository.backend_api.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep the last 15 images"

      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 15
      }

      action = {
        type = "expire"
      }
    }]
  })
}

