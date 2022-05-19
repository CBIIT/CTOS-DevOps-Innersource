output "opensearch_cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.opensearch.arn
  description = "The ARN for the log group that stores Opensearch logs in CloudWatch"
}

output "snapshot_iam_role_arn" {
  value = aws_iam_role.opensearch.arn
  description = "The ARN for the IAM role that enables manual snapshot events for Opensearch"
}

output "opensearch_arn" {
  value = aws_opensearch_domain.os.arn
  description = "The ARN for the Opensearch Cluster/Instance"
}

output "opensearch_domain" {
  value = aws_opensearch_domain.os.domain_name
  description = "The Domain Name of the Opensearch Cluster/Instance"
}

output "s3_snapshot_bucket_arn" {
  value = aws_s3_bucket.snapshot.arn
  description = "The ARN of the S3 Bucket that stores snapshots for Opensearch"
}

output "s3_snapshot_bucket_name" {
  value = aws_s3_bucket.snapshot.bucket
  description = "The bucket name for the S3 Bucket that stores snapshots for Opensearch"
}

output "opensearch_security_group_id" {
  value = aws_security_group.opensearch.id
  description = "The security group that controls access to the Opensearch Cluster/Instance"
}