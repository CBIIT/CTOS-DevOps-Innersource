output "opensearch_domain_id" {
  value       = aws_opensearch_domain.os.domain_id
  description = "The ID of the OpenSearch domain"
}

output "opensearch_domain_arn" {
  value = aws_opensearch_domain.os.arn 
  description = "The arn of the OpenSearch domain"
}

output "opensearch_domain_name" {
  value       = aws_opensearch_domain.os.domain_name
  description = "The domain name of the OpenSearch domain"
}

output "opensearch_endpoint" {
  value       = aws_opensearch_domain.os.endpoint
  description = "The OpenSearch domain endpoint URL"
}

output "opensearch_engine_version" {
  value       = aws_opensearch_domain.os.engine_version
  description = "The engine version of the OpenSearch domain (i.e. OpenSearch_1.2)"
}

output "opensearch_kibana_endpoint" {
  value       = aws_opensearch_domain.os.kibana_endpoint
  description = "The OpenSearch domain dashboard endpoint URL"
}

output "s3_snapshot_bucket_name" {
  value       = aws_s3_bucket.opensearch_snapshot.bucket
  description = "The name of the bucket that stores the OpenSearch domain manual snapshots"
}

output "s3_snapshot_bucket_arn" {
  value       = aws_s3_bucket.opensearch_snapshot.arn
  description = "The arn of the bucket that stores the OpenSearch domain manual snapshots"
}

output "opensearch_securitygroup_arn" {
  value = aws_security_group.opensearch.arn
}

output "opensearch_securitygroup_name" {
  value = aws_security_group.opensearch.name
}

output "opensearch_securitygroup_id" {
  value = aws_security_group.opensearch.id
}