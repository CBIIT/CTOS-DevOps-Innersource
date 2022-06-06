# The following rules are excluded from this module:
### ELB_CROSS_ZONE_LOAD_BALANCING_ENABLED
### ELB_CUSTOM_SECURITY_POLICY_SSL_CHECK
### ELB_PREDEFINED_SECURITY_POLICY_SSL_CHECK
### ELB_ACM_CERTIFICATE_REQUIRED

resource "aws_config_config_rule" "alb_desync_mode_check" {
  name        = "alb-desync-mode-check"
  description = "Checks if an Application Load Balancer (ALB) is configured with a user defined desync mitigation mode. The rule is NON_COMPLIANT if ALB desync mitigation mode does not match with the user defined desync mitigation mode."

  source {
    owner             = "AWS"
    source_identifier = "ALB_DESYNC_MODE_CHECK"
  }
}

resource "aws_config_config_rule" "alb_http_drop_invalid_header_enabled" {
  name        = "alb-http-drop-invalid-header-enabled"
  description = "Checks if rule evaluates AWS Application Load Balancers (ALB) to ensure they are configured to drop http headers. The rule is NON_COMPLIANT if the value of routing.http.drop_invalid_header_fields.enabled is set to false."

  source {
    owner             = "AWS"
    source_identifier = "ALB_HTTP_DROP_INVALID_HEADER_ENABLED"
  }
}

resource "aws_config_config_rule" "alb_http_to_https_redirection_check" {
  name        = "alb-http-to-https-redirection-check"
  description = "Checks if HTTP to HTTPS redirection is configured on all HTTP listeners of Application Load Balancers. The rule is NON_COMPLIANT if one or more HTTP listeners of Application Load Balancer do not have HTTP to HTTPS redirection configured. The rule is also NON_COMPLIANT if one of more HTTP listeners have forwarding to an HTTP listener instead of redirection."

  source {
    owner             = "AWS"
    source_identifier = "ALB_HTTP_TO_HTTPS_REDIRECTION_CHECK"
  }
}

resource "aws_config_config_rule" "alb_waf_enabled" {
  name        = "alb-waf-enabled"
  description = "Checks if Web Application Firewall (WAF) is enabled on Application Load Balancers (ALBs). This rule is NON_COMPLIANT if key: waf.enabled is set to false."

  source {
    owner             = "AWS"
    source_identifier = "ALB_WAF_ENABLED"
  }
}

resource "aws_config_config_rule" "elbv2_multiple_az" {
  name        = "elbv2-multiple-az"
  description = "Checks if an Elastic Load Balancer V2 (Application, Network, or Gateway Load Balancer) has registered instances from multiple Availability Zones (AZ's). The rule is NON_COMPLIANT if an Elastic Load Balancer V2 has instances registered in less than 2 AZ's."

  source {
    owner             = "AWS"
    source_identifier = "ELBV2_MULTIPLE_AZ"
  }
}


resource "aws_config_config_rule" "elb_deletion_protection_enabled" {
  name        = "elb-deletion-protection-enabled"
  description = "Checks if Elastic Load Balancing has deletion protection enabled. The rule is NON_COMPLIANT if deletion_protection.enabled is false."

  source {
    owner             = "AWS"
    source_identifier = "ELB_DELETION_PROTECTION_ENABLED"
  }
}

resource "aws_config_config_rule" "elb_logging_enabled" {
  name        = "elb-logging-enabled"
  description = "Checks if the Application Load Balancer and the Classic Load Balancer have logging enabled. The rule is NON_COMPLIANT if the access_logs.s3.enabled is false or access_logs.S3.bucket is not equal to the s3BucketName that you provided."

  source {
    owner             = "AWS"
    source_identifier = "ELB_LOGGING_ENABLED"
  }
}