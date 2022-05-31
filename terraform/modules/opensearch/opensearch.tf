resource "aws_opensearch_domain" "opensearch" {
  domain_name    = local.domain
  engine_version = var.engine_version

  cluster_config {
    instance_type          = var.instance_type
    instance_count         = var.data_node_count
    zone_awareness_enabled = var.multi-az
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.ebs_volume_size
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = [aws_security_group.opensearch.id]
  }

  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_hour
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.opensearch.arn
    enabled                  = true
    log_type                 = var.log_type
  }

}