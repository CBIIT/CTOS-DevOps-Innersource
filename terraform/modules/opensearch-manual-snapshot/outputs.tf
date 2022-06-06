output "opensearch_domain_id" {
  value = aws_opensearch_domain.os.domain_id
}

output "opensearch_domain_name" {
  value = aws_opensearch_domain.os.domain_name
}

output "opensearch_endpoint" {
  value = aws_opensearch_domain.os.endpoint
}

output "opensearch_kibana_endpoint" {
  value = aws_opensearch_domain.os.kibana_endpoint
}

output "opensearch_engine_version" {
  value = aws_opensearch_domain.os.engine_version
}

output "s3_snapshot_bucket_name" {
  value = aws_s3_bucket.opensearch_snapshot.bucket
}

output "s3_snapshot_bucket_arn" {
 value = aws_s3_bucket.opensearch_snapshot.arn 
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