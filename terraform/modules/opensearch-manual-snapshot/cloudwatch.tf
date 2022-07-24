resource "aws_cloudwatch_log_group" "os_index_slow" {
  name              = "${aws_opensearch_domain.os.domain_name}-index-slow-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_group" "os_search_slow" {
  name              = "${aws_opensearch_domain.os.domain_name}-search-slow-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_group" "os_app" {
  name              = "${aws_opensearch_domain.os.domain_name}-application-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_resource_policy" "os" {
  policy_name     = local.log_policy
  policy_document = data.aws_iam_policy_document.cloudwatch.json
}
