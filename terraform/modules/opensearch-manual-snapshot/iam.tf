resource "aws_iam_service_linked_role" "os" {
  aws_service_name = "opensearchservice.amazonaws.com"
  description      = "creates the AWSServiceRoleForAmazonOpenSearchService role"
}
