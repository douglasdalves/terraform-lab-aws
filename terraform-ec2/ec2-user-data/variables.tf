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

variable "service_name" {
  type        = string
  description = ""
  default     = "autoscaling-app"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0cff7528ff583bf9a"
}
# Amazon Linux 2 Kernel 5.10 AMI 2.0.20220426.0 x86_64 HVM gp2

variable "instance_key_name" {
  type        = string
  description = ""
  default     = "ssh-ec2-terraform"
}
