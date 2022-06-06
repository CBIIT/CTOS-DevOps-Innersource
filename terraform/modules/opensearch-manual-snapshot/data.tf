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

