variable "env" {}
# Solicitar o ambiente no plan

variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1" # N.virginia
}

# Usar este atributo somente se não for o profile "default" no arquivo ~/.aws/credentials
variable "aws_profile" {
  type        = string
  #description = "default" # Usar este apenas quando precisar escolher
  default     = "default"
}

variable "instance_ami" {
  type        = string
  default     = "ami-0022f774911c1d690"
  # Amazon Linux 2 Kernel 5.10 AMI 2.0.20220426.0 x86_64 HVM gp2

  # Valida a AMI e apresenta uma msg de erro
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance_number" {
  type = object({
    dev  = number
    prod = number
  })
  description = "Number of instances to create"
  default = {
    dev  = 1
    prod = 2
  }
}

variable "instance_type" {
  type = object({
    dev  = string
    prod = string
  })
  description = ""
  default = {
    dev  = "t2.micro"
    prod = "t2.micro"
  }
}
