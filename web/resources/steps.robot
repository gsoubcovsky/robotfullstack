*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
## Hooks
Abrir Navegador
    Open Browser    http://spotlab.herokuapp.com/   Chrome
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser

## Steps
Dado que "${email}" é o meu email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input Text      id:email    ${email}
    Click Element   xpath=//button[@type='submit']

Então devo ver a area logada
    Wait Until Element Is Visible   class:dashboard
    Page Should Contain Element    class:dashboard

Então devo ver o alerta "${expected_alert}"
    Wait Until Element Is Visible   class:alert
    Element Text Should Be    class:alert   ${expected_alert}