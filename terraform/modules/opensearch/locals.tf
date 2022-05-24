locals {
  domain           = "${var.app}-opensearch-${var.tier}"
  sg               = "${var.app}-opensearch-${var.tier}"
  log_group        = "${var.app}-opensearch-${var.tier}"
  log_policy       = "${var.policy_prefix}-${var.app}-opensearch-logs-${var.tier}"
  snapshot_bucket  = "${var.app}-opensearch-snapshots-${var.tier}"
  snapshot_role    = "${var.policy_prefix}-${var.app}-opensearch-snapshot-role-${var.tier}"
  snapshot_policy  = "${var.policy_prefix}-${var.app}-opensearch-snapshot-policy-${var.tier}"
  jenkins_snapshot = "${var.policy_prefix}-${var.app}-jenkins-pass-role-os-snapshot-${var.tier}"
  permission_boundary_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser"
}
