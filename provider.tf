provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Projeto      = "Projeto Terraform do Felipe"
      Owner        = "Felipe"
      Centro-Custo = "12345"
    }
  }
}