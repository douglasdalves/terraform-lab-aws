# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "aulas_devops"
workspaces {
      name = "teste_aula"
    }
 }
}
