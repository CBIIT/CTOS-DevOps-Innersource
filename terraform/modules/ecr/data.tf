data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "repository" {

  statement {
    sid    = "ElasticContainerRegistryPushAndPull"
    effect = "Allow"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:saml-provider/okta"]
    }

    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::${var.prod_account_id}:root"]
    }

  }
}