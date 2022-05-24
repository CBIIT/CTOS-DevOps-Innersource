resource "aws_cloudwatch_log_group" "opensearch" {
  name              = local.log_group
  retention_in_days = var.log_retention

}

resource "aws_cloudwatch_log_resource_policy" "opensearch" {
  policy_name     = local.log_policy
  policy_document = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": [
        "logs:PutLogEvents",
        "logs:PutLogEventsBatch",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
CONFIG
}