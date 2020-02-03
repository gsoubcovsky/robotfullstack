*** Settings ***
Resource  ../resources/steps.robot
Documentation  Spots
...  Para que eu possa disponibilizar spots de empresas para Devs e QAs
...  Sendo um admin de spots
...  Quero poder cadastrar novas empresas
Test Setup  Run Keywords  Abrir Navegador  AND
...         Logar como Admin
Test Teardown  Run Keywords  Fechar Navegador   AND
...            Deletar Company

*** Test Cases ***
Novo Spot
    Dado que eu tenho um spot disponivel na empresa "Google"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria é "10" reais
    Quando faço o cadastro deste spot
    Então devo ver o spot e a valor da diaria no dashboard

## Desafio
### Criar outros scenarios de criação do spot
#### Spot sem o nome da empresa
##### Live #2