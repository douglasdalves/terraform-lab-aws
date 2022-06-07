variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

variable "environment" {
  type        = string
  description = ""
  default     = "test"
}

variable "s3_tags" {
  type        = map(string)
  description = ""
  default = {
    Criado    = "05-06-22"
    Project   = "lab-udemy"
    ManagedBy = "Terraform"
  }
}