data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "task_execution_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type = "Service"
    }
  }
}

data "aws_iam_policy_document" "ecs_policy_doc" {
  statement {
    effect    = "Allow"
    actions   = ["ecs:*"]
    resources = ["arn:aws:ecs:${var.region}:${data.aws_caller_identity.current.account_id}:cluster/${local.ecs_cluster_name}"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetLifecyclePolicy",
      "ecr:GetRepositoryPolicy",
      "ecr:InitiateLayerUpload",
      "ecr:ListTagsForResource",
      "ecr:UploadLayerPart"
    ]
    resources = ["arn:aws:ecr:${var.region}:${data.aws_caller_identity.current.account_id}:repository/${var.app}-${terraform.workspace}-*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "es:*"
    ]
    resources = ["arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${var.app}-opensearch-${terraform.workspace}"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:*"
    ]
    resources = ["arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id}:instance/${var.db_instance}"]
  }
}

data "aws_iam_policy_document" "task_logs_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}