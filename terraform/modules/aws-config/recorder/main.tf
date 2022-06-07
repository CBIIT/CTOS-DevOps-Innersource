resource "aws_config_configuration_recorder" "recorder" {
  name = "config-recorder"
  role_arn = aws_iam_role.recorder.arn
}

resource "aws_iam_role" "recorder" {
  name = "${var.iam_prefix}-config-recorder-role"
  assume_role_policy = data.aws_iam_policy_document.recorder.json
  permissions_boundary = var.permission_boundary_arn
}

data "aws_iam_policy_document" "recorder" {
  statement {
    actions = [ "sts:AssumeRole" ]
    effect = "Allow"
    sid = "AwsConfigRecorder"
    principals {
      type = "Service"
      identifiers = [ "config.amazonaws.com" ]
    }
  }
}
