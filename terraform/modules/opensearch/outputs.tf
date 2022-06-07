output "opensearch_arn" {
  value = aws_opensearch_domain.opensearch.arn
}

output "opensearch_domain_id" {
  value = aws_opensearch_domain.opensearch.domain_id
}

output "opensearch_domain_name" {
  value = aws_opensearch_domain.opensearch.domain_name
}

output "opensearch_endpoint" {
  value = aws_opensearch_domain.opensearch.endpoint
}

output "opensearch_securitygroup_id" {
  value = aws_security_group.opensearch.id
}