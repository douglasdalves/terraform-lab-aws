
resource "aws_s3_bucket" "b" {
  bucket = "teste-import-tf"

  tags = {
    project        = "teste-import-tf-2023"
    Environment = "test"
  }
}