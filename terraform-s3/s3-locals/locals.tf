locals {
  ip_filepath = "ips.json"
# Variavel do nome do objeto a ser criano no bucket

  common_tags = {
    Service     = "Lab-udemy"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "dalves"
# tags para o bucket
  }
}