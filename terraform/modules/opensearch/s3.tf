resource "aws_s3_bucket" "opensearch_snapshot" {
  bucket = local.snapshot_bucket
}
