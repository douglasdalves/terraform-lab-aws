#####################################
#                                   #
# Compasso UOL Baseline             #
# Set up CloudTrail                 #
#                                   #
#####################################
resource "aws_cloudtrail" "main" {
  count = var.enable_cloudtrail ? 1 : 0

  depends_on = [aws_s3_bucket_policy.main]

  name                          = "conta-projeto-trail-${data.aws_caller_identity.current.account_id}"
  s3_bucket_name                = aws_s3_bucket.enable_cloudtrail.0.id
  include_global_service_events = "true"
  enable_logging                = "true"
  is_multi_region_trail         = var.is_multi_region_trail

  event_selector {
    include_management_events = "true"
    read_write_type           = "All"
    data_resource {
      type   = "AWS::Lambda::Function"
      values = ["arn:aws:lambda"]
    }
  }
  event_selector {
    include_management_events = "true"
    read_write_type           = "All"
    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::"]
    }
  }
}

resource "aws_s3_bucket" "enable_cloudtrail" {
  count  = var.enable_cloudtrail ? 1 : 0
  bucket = "conta-projeto-trail-${data.aws_caller_identity.current.account_id}"
  tags   = var.registro
}

resource "aws_s3_bucket_acl" "enable_acl" {
  count  = var.enable_cloudtrail ? 1 : 0
  bucket = aws_s3_bucket.enable_cloudtrail.0.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "enable_version" {
  count  = var.enable_cloudtrail ? 1 : 0
  bucket = aws_s3_bucket.enable_cloudtrail.0.id
  versioning_configuration {
    status = "Disabled"
  }
}


resource "aws_s3_bucket_policy" "main" {
  count = var.enable_cloudtrail ? 1 : 0

  depends_on = [aws_s3_bucket.enable_cloudtrail]

  bucket = aws_s3_bucket.enable_cloudtrail.0.id
  policy = data.aws_iam_policy_document.role_policy.0.json
}
data "aws_iam_policy_document" "role_policy" {
  count = var.enable_cloudtrail ? 1 : 0

  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl",
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    resources = [
      "${aws_s3_bucket.enable_cloudtrail.0.arn}"
    ]
  }
  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"
    actions = [
      "s3:PutObject"
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    resources = [
      "${aws_s3_bucket.enable_cloudtrail.0.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values = [
        "bucket-owner-full-control"
      ]
    }
  }
}