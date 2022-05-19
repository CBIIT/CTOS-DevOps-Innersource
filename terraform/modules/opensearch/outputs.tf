output "opensearch_cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.opensearch.arn
}

output "snapshot_iam_role_arn" {
  value = aws_iam_role.opensearch.arn
}

output "opensearch_arn" {
  value = aws_opensearch_domain.os.arn
}

output "opensearch_domain" {
  value = aws_opensearch_domain.os.domain_name
}

output "s3_snapshot_bucket_arn" {
  value = aws_s3_bucket.snapshot.arn
}

output "s3_snapshot_bucket_name" {
  value = aws_s3_bucket.snapshot.bucket
}

output "opensearch_security_group_id" {
  value = aws_security_group.opensearch.id
}