resource "aws_iam_service_linked_role" "os" {
  count            = var.create_service_role ? 1 : 0
  aws_service_name = "opensearchservice.amazonaws.com"
}
