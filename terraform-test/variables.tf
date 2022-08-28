variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

#-----------------------------------------------------
variable "aws_profile" {
  type        = string
  description = "Informar o profile configurado no aws cli"
  default     = "lab-terraform"
  #default     = "demonstracao-perito"
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
    "ManagedBy" = "Terraform"
  }
}