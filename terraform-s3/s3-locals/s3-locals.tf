resource "aws_s3_bucket" "this" {
  bucket = "lab-s3-locals-dalves"
  tags   = local.common_tags
}

resource "aws_s3_object" "this" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${local.ip_filepath}"
  source       = local.ip_filepath
  etag         = filemd5(local.ip_filepath)
  content_type = "application/json"
# Dados para aplicacao de arquivo no bucket
  tags = local.common_tags
}