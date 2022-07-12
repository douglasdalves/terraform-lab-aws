locals {
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }
  # Variavel das subnet

  common_tags = {
    Project   = "AWS-udemy-lab"
    CreatedAt = "2022-06-22"
    ManagedBy = "Terraform"
    Service   = "Auto Scaling App"
    # Tags como variaveis
  }
}
