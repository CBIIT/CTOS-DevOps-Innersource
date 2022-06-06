resource "aws_iam_role" "os_snapshot" {
  name                 = local.snapshot_role
  assume_role_policy   = data.aws_iam_policy_document.os_sts.json
  permissions_boundary = local.permission_boundary_arn
}

resource "aws_iam_policy" "os_snapshot" {
  name   = local.snapshot_policy
  policy = data.aws_iam_policy_document.os_snapshot.json
}