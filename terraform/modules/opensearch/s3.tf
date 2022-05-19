resource "aws_s3_bucket" "snapshot" {
  bucket = "${aws_opensearch_domain.os.domain_name}-snapshot-bucket"
}