locals {
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }
  # Variavel das subnet

  common_tags = {
    Project   = "AWS-lab-Amazon-linux"
    CreatedAt = "2022-06-24"
    ManagedBy = "Terraform"
    Service   = "Test UserData"
    # Tags como variaveis
  }
}
