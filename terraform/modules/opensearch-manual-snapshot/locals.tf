locals {
  domain          = "${var.app}-opensearch-${var.tier}"
  sg              = "${var.app}-opensearch-${var.tier}"
  log_group       = "${var.app}-opensearch-${var.tier}"
  log_policy      = "${var.iam_prefix}-${var.app}-opensearch-logs-${var.tier}"
  snapshot_bucket = "${var.app}-opensearch-snapshots-${var.tier}"
}
