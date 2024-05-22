terraform {
  backend "s3" {
    bucket         = "ada-projeto-terraform-dev-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "ada-projeto-terraform-dev-state-lock-table"
  }
}