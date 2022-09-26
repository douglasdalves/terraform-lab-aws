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
}


variable "auto_sg" {
  type        = string
  description = "Informar nome do auto scaling grupo"
}

# variable "auto_sg_on" {
#   type = object({
#     min_size         = string
#     max_size         = string
#     desired_capacity = string
#   })
# }

variable "auto_sg_min" {
  type        = string
  description = "Informar o Min do start."
}

variable "auto_sg_max" {
  type        = string
  description = "Informar Max do start."
}

variable "auto_sg_desired" {
  type        = string
  description = "Informar o desired_capacity do start."
}
