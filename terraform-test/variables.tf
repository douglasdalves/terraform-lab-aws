variable "aws_region" {
  type        = string
  description = "Preecha a região a ser usada."
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
#   default     = 
# }


variable "registro" {
  type        = map(string)
  description = "Tags do terraform para contas."

  default = {
    "Owner"       = "Compass-cloud-n1"
    "Environment" = "Conta-SPAM-Partnet-led"
    "ManagedBy"   = "Terraform"
  }
}