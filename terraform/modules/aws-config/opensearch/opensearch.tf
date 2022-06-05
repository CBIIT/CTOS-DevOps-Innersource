# The following rules are excluded from this module:
### opensearch-access-control-enabled
### opensearch-data-node-fault-tolerance

# Notes:
### name the resources based on the source identifier, only chaning the text case
### name the rule the same as the resource name, except replace underscores with hyphens
### add a description which reflects what AWS offers for the rule description. add the rule trigger type to the end of the description


resource "aws_config_config_rule" "opensearch_audit_logging_enabled" {
  name = "opensearch-audit-logging-enabled"
  description = "Checks if Amazon OpenSearch Service domains have audit logging enabled. The rule is NON_COMPLIANT if an OpenSearch Service domain does not have audit logging enabled. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_AUDIT_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "opensearch_encrypted_at_rest" {
  name = "opensearch-encrypted-at-rest"
  description = "Checks if Amazon OpenSearch Service domains have encryption at rest configuration enabled. The rule is NON_COMPLIANT if EncryptionAtRestOptions field is not enabled. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_ENCRYPTED_AT_REST"
  }
}

resource "aws_config_config_rule" "opensearch_https_required" {
  name = "opensearch-https-required"
  description = "Checks whether connections to OpenSearch domains are using HTTPS. The rule is NON_COMPLIANT if the Amazon OpenSearch domain 'EnforceHTTPS' is not 'true' or is 'true' and 'TLSSecurityPolicy' is not in 'tlsPolicies'. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_HTTPS_REQUIRED"
  }
}

resource "aws_config_config_rule" "opensearch_in_vpc_only" {
  name = "opensearch-in-vpc-only"
  description = "Checks if Amazon OpenSearch Service domains are in an Amazon Virtual Private Cloud (VPC). The rule is NON_COMPLIANT if an OpenSearch Service domain endpoint is public. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_IN_VPC_ONLY"
  }
}

resource "aws_config_config_rule" "opensearch_logs_to_cloudwatch" {
  name = "opensearch-logs-to-cloudwatch"
  description = "Checks if Amazon OpenSearch Service domains are configured to send logs to Amazon CloudWatch Logs. The rule is NON_COMPLIANT if logging is not configured. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_LOGS_TO_CLOUDWATCH"
  }
}

resource "aws_config_config_rule" "opensearch_node_to_node_encryption_check" {
  name = "opensearch-node-to-node-encryption-enabled"
  description = "Check that Amazon OpenSearch Service nodes are encrypted end to end. The rule is NON_COMPLIANT if the node-to-node encryption is not enabled on the domain. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK"
  }
}
