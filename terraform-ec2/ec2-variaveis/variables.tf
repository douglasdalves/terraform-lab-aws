variable "environment" {
  type        = string
  description = "Test"
}

variable "aws_region" {
  type        = string
  description = "us-east-1" #Norte Virginia
}

# Usar este atributo somente se não for o profile "default" no arquivo ~/.aws/credentials
variable "aws_profile" {
  type        = string
  description = "default"
}

variable "instance_ami" {
  type        = string
  description = "ami-0022f774911c1d690"
}
# Amazon Linux 2 Kernel 5.10 AMI 2.0.20220426.0 x86_64 HVM gp2

variable "instance_type" {
  type        = string
  description = "t2.micro"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Ubuntu"
    Project = "Curso AWS-Terraform udemy"
  }
}
