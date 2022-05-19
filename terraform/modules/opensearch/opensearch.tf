resource "aws_opensearch_domain" "os" {
  domain_name    = var.domain
  engine_version = var.engine_version

  cluster_config {
    instance_type = var.instance_type
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.ebs_volume_size
  }

  vpc_options {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [aws_security_group.opensearch.id]
  }

  log_publishing_options {
    enabled                  = var.log_publishing_enabled
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.opensearch.arn
    log_type                 = var.log_type
  }

  encrypt_at_rest {
    enabled = var.encrypt_at_rest
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption
  }

  snapshot_options {
    automated_snapshot_start_hour = var.auto_snapshot_hour
  }

  advanced_security_options {
    enabled = var.advanced_security_options_enabled
    master_user_options {
      master_user_arn = "arn:aws:sts::${var.account_id}:federated-user/*"
    }
  }
}
