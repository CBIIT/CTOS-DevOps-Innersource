locals {
  frontend_repository_name    = "${var.app}-frontend-${terraform.workspace}"
  backend_repository_name     = "${var.app}-backend-${terraform.workspace}"
  backend_api_repository_name = "${var.app}-backend-api-${terraform.workspace}"
}