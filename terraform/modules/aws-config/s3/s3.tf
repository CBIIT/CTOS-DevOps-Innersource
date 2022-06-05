# The following rules are excluded from this module:
### 


resource "aws_config_config_rule" "s3_bucket_acl_prohibited" {
  name        = "s3-bucket-acl-prohibited"
  description = "Checks if Amazon Simple Storage Service (Amazon S3) Buckets allow user permissions through access control lists (ACLs). The rule is NON_COMPLIANT if ACLs are configured for user access in Amazon S3 Buckets."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_ACL_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_blacklisted_actions_prohibited" {
  name        = "s3-bucket-blacklisted-actions-prohibited"
  description = "Checks if the Amazon Simple Storage Service bucket policy does not allow blacklisted bucket-level and object-level actions on resources in the bucket for principals from other AWS accounts. For example, the rule checks that the Amazon S3 bucket policy does not allow another AWS account to perform any s3:GetBucket* actions and s3:DeleteObject on any object in the bucket. The rule is NON_COMPLIANT if any blacklisted actions are allowed by the Amazon S3 bucket policy."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_BLACKLISTED_ACTIONS_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_level_public_access_prohibited" {
  name        = "s3-bucket-level-public-access-prohibited"
  description = "Checks if Amazon Simple Storage Service (Amazon S3) buckets are publicly accessible. This rule is NON_COMPLIANT if an Amazon S3 bucket is not listed in the excludedPublicBuckets parameter and bucket level settings are public."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_LEVEL_PUBLIC_ACCESS_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_logging_enabled" {
  name        = "s3-bucket-logging-enabled"
  description = "Checks whether logging is enabled for your S3 buckets."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_policy_grantee_check" {
  name        = "s3-bucket-policy-grantee-check"
  description = "Checks that the access granted by the Amazon S3 bucket is restricted by any of the AWS principals, federated users, service principals, IP addresses, or VPCs that you provide. The rule is COMPLIANT if a bucket policy is not present. For example, if the input parameter to the rule is the list of two principals: 111122223333 and 444455556666 and the bucket policy specifies that only 111122223333 can access the bucket, then the rule is COMPLIANT. With the same input parameters: If the bucket policy specifies that 111122223333 and 444455556666 can access the bucket, it is also compliant. However, if the bucket policy specifies that 999900009999 can access the bucket, the rule is NON-COMPLIANT."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_POLICY_GRANTEE_CHECK"
  }
}

resource "aws_config_config_rule" "s3_bucket_policy_not_more_permissive" {
  name        = "s3-bucket-policy-not-more-permissive"
  description = "Checks if your Amazon Simple Storage Service bucket policies do not allow other inter-account permissions than the control Amazon S3 bucket policy that you provide."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_POLICY_NOT_MORE_PERMISSIVE"
  }
}

resource "aws_config_config_rule" "s3_bucket_public_read_prohibited" {
  name        = "s3-bucket-public-read-prohibited"
  description = "Checks if your Amazon S3 buckets do not allow public read access. The rule checks the Block Public Access settings, the bucket policy, and the bucket access control list (ACL)."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_public_write_prohibited" {
  name        = "s3-bucket-public-write-prohibited"
  description = "Checks if your Amazon S3 buckets do not allow public write access. The rule checks the Block Public Access settings, the bucket policy, and the bucket access control list (ACL)."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_replication_enabled" {
  name        = "s3-bucket-replication-enabled"
  description = "Checks whether the Amazon S3 buckets have cross-region replication enabled."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_REPLICATION_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_server_side_encryption_enabled" {
  name        = "s3-bucket-server-side-encryption-enabled"
  description = "Checks if your Amazon S3 bucket either has the Amazon S3 default encryption enabled or that the Amazon S3 bucket policy explicitly denies put-object requests without server side encryption that uses AES-256 or AWS Key Management Service. The rule is NON_COMPLIANT if your Amazon S3 bucket is not encrypted by default."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_ssl_requests_only" {
  name        = "s3-bucket-ssl-requests-only"
  description = "Checks if Amazon S3 buckets have policies that require requests to use Secure Socket Layer (SSL). The rule is COMPLIANT if buckets explicitly deny access to HTTP requests. The rule is NON_COMPLIANT if bucket policies allow HTTP requests."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SSL_REQUESTS_ONLY"
  }
}

resource "aws_config_config_rule" "s3_bucket_versioning_enabled" {
  name        = "s3-bucket-versioning-enabled"
  description = "Checks if versioning is enabled for your S3 buckets. Optionally, the rule checks if MFA delete is enabled for your S3 buckets."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_lifecycle_policy_check" {
  name        = "s3-lifecycle-policy-check"
  description = "Checks if a lifecycle rule is configured for an Amazon Simple Storage Service (Amazon S3) bucket. The rule is NON_COMPLIANT if there is no active lifecycle configuration rules or the configuration does not match with the parameter values."

  source {
    owner             = "AWS"
    source_identifier = "S3_LIFECYCLE_POLICY_CHECK"
  }
}
