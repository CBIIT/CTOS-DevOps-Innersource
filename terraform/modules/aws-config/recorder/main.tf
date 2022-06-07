resource "aws_config_configuration_recorder" "recorder" {
  name = "config-recorder"
  role_arn = aws_iam_role.recorder.arn
}

resource "aws_iam_role" "recorder" {
  name = "power-user-config-recorder-role"
  assume_role_policy = data.aws_iam_policy_document.recorder.json
}

data "aws_iam_policy_document" "recorder" {
  statement {
    actions = [ "sts:AssumeRole" ]
    effect = "Allow"
    sid = "AwsConfigRecorder"
    principals {
      type = "AWS"
      identifiers = [ "config.amazonaws.com" ]
    }
  }
}
