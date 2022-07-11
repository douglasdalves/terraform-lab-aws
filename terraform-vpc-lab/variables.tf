variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "lab-terraform"
}

variable "aws_account_id" {
  type        = number
  description = ""
  default     = 060697273175
}

#variable "service_name" {
#  type        = string
#  description = ""
#  default     = "autoscaling-app"
#}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}
