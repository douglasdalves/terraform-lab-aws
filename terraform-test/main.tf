terraform {
  required_version = ">=1.2.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
