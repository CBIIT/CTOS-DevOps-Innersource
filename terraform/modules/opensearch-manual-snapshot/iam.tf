resource "aws_iam_role" "os_snapshot" {
  name                 = local.snapshot_role
  assume_role_policy   = data.aws_iam_policy_document.os_sts.json
  permissions_boundary = local.permission_boundary_arn
}

resource "aws_iam_policy" "os_snapshot" {
  name   = local.snapshot_policy
  policy = data.aws_iam_policy_document.os_snapshot.json
}

resource "aws_iam_role_policy_attachment" "os_snapshot" {
  role       = aws_iam_role.os_snapshot.name
  policy_arn = aws_iam_policy.os_snapshot.arn
}

# To allow Jenkins Host to assume the snapshot role defined above.


resource "aws_iam_role_policy_attachment" "jenkins_snapshot" {
  role       = var.jenkins_profile_role_name
  policy_arn = aws_iam_policy.jenkins_snapshot.arn
}