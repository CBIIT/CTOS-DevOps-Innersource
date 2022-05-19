resource "aws_cloudwatch_log_group" "opensearch" {
  name              = "${var.app}-opensearch-logs-${terraform.workspace}"
  retention_in_days = var.log_retention
}