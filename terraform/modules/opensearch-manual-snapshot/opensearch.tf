resource "aws_opensearch_domain" "os" {
  domain_name    = local.domain
  engine_version = "OpenSearch_${var.engine_version}"

  cluster_config {
    dedicated_master_enabled = var.master_node_enabled
    dedicated_master_count   = var.master_node_enabled ? var.master_node_count : null
    dedicated_master_type    = var.master_node_enabled ? var.master_node_type : null

    instance_count = var.hot_node_count
    instance_type  = var.hot_node_type

    warm_enabled = var.warm_node_enabled
    warm_count   = var.warm_node_enabled ? var.warm_node_count : null
    warm_type    = var.warm_node_enabled ? var.warm_node_type : null

    cold_storage_options {
      enabled = false
    }

    zone_awareness_enabled = var.multi_az

    zone_awareness_config {
      availability_zone_count = var.availability_zone_count
    }
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.ebs_volume_size
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = [aws_security_group.os.id]
  }

  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_hour
  }

  domain_endpoint_options {
    enforce_https           = true
    tls_security_policy     = "Policy-Min-TLS-1-2-2019-07"
    custom_endpoint_enabled = false
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.os_index_slow.arn
    enabled                  = var.enable_os_index_slow_logs
    log_type                 = "INDEX_SLOW_LOGS"
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.os_search_slow.arn
    enabled                  = var.enable_os_search_slow_logs
    log_type                 = "SEARCH_SLOW_LOGS"
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.os_app.arn
    enabled                  = var.enable_os_application_logs
    log_type                 = "ES_APPLICATION_LOGS"
  }

}

resource "aws_opensearch_domain_policy" "os" {
  domain_name     = aws_opensearch_domain.os.domain_name
  access_policies = data.aws_iam_policy_document.os.json
}
