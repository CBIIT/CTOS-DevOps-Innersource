data "aws_iam_policy_document" "logs" {

  statement {
    sid    = "AllowAlbAccount"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.account.account_id}:root"
      ]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.logs.arn}/*"
    ]
  }

  statement {
    sid    = "AllowAlbLogDelivery"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.logs.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    sid    = "AwsLogDeliveryACL"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl"
    ]

    resources = [
      aws_s3_bucket.logs.arn
    ]
  }
}

data "aws_acm_certificate" "wildcard" {
  domain      = "*.cancer.gov"
  statuses    = ["ISSUED"]
  types       = ["IMPORTED"]
  most_recent = true
}