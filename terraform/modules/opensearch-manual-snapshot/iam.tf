resource "aws_iam_service_linked_role" "os" {
  count = terraform.workspace == "dev" || terraform.workspace == "stage" ? 1 : 0
  aws_service_name = "opensearchservice.amazonaws.com"
  description      = "creates the AWSServiceRoleForAmazonOpenSearchService role"
}
