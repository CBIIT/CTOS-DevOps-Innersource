resource "aws_cloudwatch_log_group" "os_index_slow" {
  name              = "${local.domain}-index-slow-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_group" "os_search_slow" {
  name              = "${local.domain}-search-slow-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_group" "os_app" {
  name              = "${local.domain}-application-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_resource_policy" "os" {
  policy_name     = local.log_policy
  policy_document = data.aws_iam_policy_document.cloudwatch.json
}
