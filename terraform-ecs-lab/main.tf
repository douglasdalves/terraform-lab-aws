terraform {
  required_version = ">=1.2.3"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


locals {
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }
  # Variavel das subnet

  common_tags = {
    Project   = "AWS-lab-ecs"
    CreatedAt = "2023-09"
    ManagedBy = "Terraform"
    # Tags como variaveis
  }
}