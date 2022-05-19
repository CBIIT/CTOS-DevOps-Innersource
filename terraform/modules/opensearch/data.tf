data "aws_iam_policy_document" "os" {

  statement {
    actions   = ["s3:ListBucket"]
    effect    = "Allow"
    resources = ["${aws_s3_bucket.snapshot.arn}"]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    effect    = "Allow"
    resources = ["${aws_s3_bucket.snapshot.arn}/*"]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["opensearchservice.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}