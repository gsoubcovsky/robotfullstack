*** Settings ***
Resource  ../../resources/spot_steps.robot
Documentation  Spots
...  Para que eu possa disponibilizar spots de empresas para Devs e QAs
...  Sendo um admin de spots
...  Quero poder cadastrar novas empresas
Test Setup  Run Keywords  Abrir Navegador  AND
...         Logar como Admin
Test Teardown  Run Keywords  Fechar Navegador   AND
...            Deletar Company
Test Template  Invalid Spot

*** Test Cases ***          Empresa          Foto               Skills          Alerta
Empty Company               ${EMPTY}         acme.jpg           python, ruby    O nome da sua empresa é obrigatório!
Empty Thumb                 Julico           ${EMPTY}           java, teste     Precisamos da foto da sua empresa!
Empty Skills                YTBR             google.jpg         ${EMPTY}        Informe pelo menos uma tecnologia :)

*** Keywords ***
Invalid Spot
    [Arguments]  ${company}  ${thumbnail}  ${skills}  ${alert}
    Dado que eu tenho um spot disponivel na empresa "${company}"
    E este spot possui a imagem "${thumbnail}"
    E usamos as seguintes tecnologias "${skills}"
    E o valor da diaria é "15" reais
    Quando faço o cadastro deste spot
    Então devo ver o alerta "${alert}"