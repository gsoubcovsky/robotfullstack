*** Settings ***
Documentation    Sessão
...     Para que eu possa ter acesso a interface de administração de spots
...     Sendo um usuario que possui um email
...     Quero poder iniciar uma nova sessão

*** Test Cases ***
Nova Sessão
    Dado que "eu@gabriel.io" é o meu email
    Quando eu entro com este email
    Então devo ver a area logada

Email Incorreto
    Dado que "eu&gabriel.io" é o meu email
    Quando eu entro com este email
    Então devo ver o alerta "Oops. Informe um email valido!"

Email não Informado
    Dado que "${EMPTY}" e o meu email
    Quando eu entro com este email
    Então devo ver o alerta "Oops. Informe um email valido!"