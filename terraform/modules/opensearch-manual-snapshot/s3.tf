resource "aws_s3_bucket" "opensearch_snapshot" {
  bucket = local.snapshot_bucket
}

resource "aws_s3_bucket_acl" "opensearch_snapshot" {
  bucket = aws_s3_bucket.opensearch_snapshot.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "opensearch_snapshot" {
  bucket                  = aws_s3_bucket.opensearch_snapshot.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "opensearch_snapshot" {
  bucket = aws_s3_bucket.opensearch_snapshot.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "opensearch_snapshot" {
  bucket = aws_s3_bucket.opensearch_snapshot.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "opensearch_snapshot" {
  bucket = aws_s3_bucket.opensearch_snapshot.id

  rule {
    id     = "transition_to_standard_ia"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 90
      storage_class   = "STANDARD_IA"
    }
  }

  rule {
    id     = "expire_objects"
    status = "Enabled"

    expiration {
      days = 360
    }

    noncurrent_version_expiration {
      noncurrent_days = 360
    }
  }
}