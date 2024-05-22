# Como executar o projeto
Execute os passos abaixo em ordem sequencial.

Faça o download do projeto ou um git pull.

## Definição de Fraude
Se houve transação em outro estado em menos de uma hora, significa que ocorreu fraude.

Obs.: se for identificada um fraude a transação fraudulenta não será enviada para o cache, isso evita que transações válidas sejam consideradas como fraudulentas, pois a comparação entre os estados onde foram realizadas as transações teria o estado onde ocorreu a fraude devido à consulta ao cache.


## Ferramentas que devem ser instaladas
[Terraform]https://developer.hashicorp.com/terraform/install

## Execução dos códigos

```BASH

# 1. Para acessar o código do ambiente de desenvolvimento navegue até a pasta dev. Execute os comandos abaixo de forma sequencial para inicializar o terraform, criar o workspace, planejar e aplicar o código:
terraform init
terraform workspace new dev
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"


# 2. Para destruir o ambiente execute o comando abixo
terraform destroy -var-file="dev.tfvars"

# 3. Para acessar o código do ambiente de produção navegue até a pasta prd. Execute os comandos abaixo de forma sequencial para inicializar o terraform, criar o workspace, planejar e aplicar o código:
terraform init
terraform workspace new prd
terraform plan -var-file="prd.tfvars"
terraform apply -var-file="prd.tfvars"


# 4. Para destruir o ambiente execute o comando abixo
terraform destroy -var-file="prd.tfvars"

```
