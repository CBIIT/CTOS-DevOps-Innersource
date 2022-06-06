data "aws_caller_identity" "current" {
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_instance" "jenkins_host" {
  instance_id = var.jenkins_host_id
}

data "aws_iam_policy_document" "os_sts" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["es.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "os_snapshot" {
  statement {
    actions   = ["s3:ListBucket"]
    effect    = "Allow"
    resources = [aws_s3_bucket.opensearch_snapshot.arn]
  }

  statement {
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    effect    = "Allow"
    resources = ["${aws_s3_bucket.opensearch_snapshot.arn}/*"]
  }
}


