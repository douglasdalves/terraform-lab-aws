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


variable "registro" {
  type        = map(string)
  description = "Tags do terraform para contas."

  default = {
    "Owner"       = "Compass-cloud-n1"
    "Environment" = "Conta-test"
    "ManagedBy"   = "Terraform"
  }
}

variable "enable_cloudtrail" {
  type    = bool
  default = true
}
variable "is_multi_region_trail" {
  type    = bool
  default = false
}


variable "cross_account_arn" {
  type    = string
  default = "arn:aws:iam::766581111222:root"
}