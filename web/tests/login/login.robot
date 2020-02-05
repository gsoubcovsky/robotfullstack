*** Settings ***
Resource  ../../resources/login_steps.robot
Documentation  Sessão
...  Para que eu possa ter acesso a interface de administração de spots
...  Sendo um usuario que possui um email
...  Quero poder iniciar uma nova sessão
Test Setup  Abrir Navegador
Test Teardown  Fechar Navegador

*** Test Cases ***
Nova Sessão
    Dado que "eu@gabriel.io" é o meu email
    Quando eu entro com este email
    Então devo ver a area logada

Email Incorreto
    [Template]  Tentativa de Login
    eu&gabriel.io  Oops. Informe um email válido!

Email não Informado
    [Template]  Tentativa de Login
    ${EMPTY}  Oops. Informe um email válido!

*** Keywords ***
## Scenario Outline
Tentativa de Login
    [Arguments]  ${email}  ${expected_message}
    Dado que "${email}" é o meu email
    Quando eu entro com este email
    Então devo ver o alerta "${expected_message}"