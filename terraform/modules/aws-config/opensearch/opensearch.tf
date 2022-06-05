# The following rules are excluded from this module:
### opensearch-access-control-enabled
### opensearch-data-node-fault-tolerance


resource "aws_config_config_rule" "opensearch_audit_logging_enabled" {
  name = "opensearch-audit-logging-enabled"
  description = "Checks if Amazon OpenSearch Service domains have audit logging enabled. The rule is NON_COMPLIANT if an OpenSearch Service domain does not have audit logging enabled."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_AUDIT_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "opensearch_encrypted_at_rest" {
  name = "opensearch-encrypted-at-rest"
  description = "Checks if Amazon OpenSearch Service domains have encryption at rest configuration enabled. The rule is NON_COMPLIANT if EncryptionAtRestOptions field is not enabled."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_ENCRYPTED_AT_REST"
  }
}

resource "aws_config_config_rule" "opensearch_https_required" {
  name = "opensearch-https-required"
  description = "Checks whether connections to OpenSearch domains are using HTTPS. The rule is NON_COMPLIANT if the Amazon OpenSearch domain 'EnforceHTTPS' is not 'true' or is 'true' and 'TLSSecurityPolicy' is not in 'tlsPolicies'."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_HTTPS_REQUIRED"
  }
}

resource "aws_config_config_rule" "opensearch_in_vpc_only" {
  name = "opensearch-in-vpc-only"
  description = "Checks if Amazon OpenSearch Service domains are in an Amazon Virtual Private Cloud (VPC). The rule is NON_COMPLIANT if an OpenSearch Service domain endpoint is public."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_IN_VPC_ONLY"
  }
}

resource "aws_config_config_rule" "opensearch_logs_to_cloudwatch" {
  name = "opensearch-logs-to-cloudwatch"
  description = "Checks if Amazon OpenSearch Service domains are configured to send logs to Amazon CloudWatch Logs. The rule is NON_COMPLIANT if logging is not configured."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_LOGS_TO_CLOUDWATCH"
  }
}

resource "aws_config_config_rule" "opensearch_node_to_node_encryption_check" {
  name = "opensearch-node-to-node-encryption-enabled"
  description = "Check that Amazon OpenSearch Service nodes are encrypted end to end. The rule is NON_COMPLIANT if the node-to-node encryption is not enabled on the domain."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK"
  }
}


