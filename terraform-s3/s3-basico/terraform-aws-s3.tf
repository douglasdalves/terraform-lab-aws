terraform {
  required_version = "1.2.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "us-east-1" # Norte virginia
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#private-bucket-w-tags
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-lab-aws-buckets3-0506202"

  tags = {
    Name        = "Bucket-lab-udemy"
    Environment = "Test"
    Managedby   = "Terraform"
    Update      = "05-06-22"
  }
}