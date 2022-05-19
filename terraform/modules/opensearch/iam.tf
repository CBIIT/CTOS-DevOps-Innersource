resource "aws_iam_role" "opensearch" {
  name               = "${var.app}-opensearch-snapshot-role-${terraform.workspace}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "os" {
  role       = aws_iam_role.opensearch.name
  policy_arn = data.aws_iam_policy_document.os.id
}
