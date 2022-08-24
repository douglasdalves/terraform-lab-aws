variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

#-----------------------------------------------------
variable "aws_profile" {
  type        = string
  description = ""
  default     = "lab-terraform"
}

# variable "aws_account_id" {
#   type        = number
#   description = ""
#   default     = 060697273175
# }


variable "registro" {
  type        = map(string)
  description = "Tags do terraform para criar payer."

  default = {
    "Owner"       = "Compass-cloud-n1"
    "Environment" = "Conta-SPAM-Partnet-led"
    "ManagedBy"   = "Terraform"
  }
}