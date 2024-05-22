variable "aws_region" {
  description = "Região AWS para provisionar os recursos"
  type        = string
  default     = "us-east-1"
}
variable "aws_access_key" {
  description = "Access Key ID da AWS"
  type        = string

}
variable "aws_secret_key" {
  description = "Secret Access Key da AWS"
  type        = string

}
variable "project_name" {
  description = "O nome do projeto baseado no ambiente de execução"
  type        = string
  default     = "ada-projeto-terraform"
}

