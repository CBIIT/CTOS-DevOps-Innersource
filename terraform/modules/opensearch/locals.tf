locals {
  domain           = "${var.app}-opensearch-${var.tier}"
  sg               = "${var.app}-opensearch-${var.tier}"
  log_group        = "${var.app}-opensearch-${var.tier}"
  log_policy       = "${var.app}-opensearch-logs-${var.tier}"
  snapshot_bucket  = "${var.app}-opensearch-snapshots-${var.tier}"
  snapshot_role    = "${var.app}-opensearch-snapshot-role-${var.tier}"
  snapshot_policy  = "${var.app}-opensearch-snapshot-policy-${var.tier}"
  jenkins_snapshot = "${var.app}-jenkins-pass-role-policy-os-snapshot-${var.tier}"
}
