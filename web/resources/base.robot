*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
## Hooks - Setup / Teardown
Abrir Navegador
    Open Browser    about:blank   chrome
    Set Window Size  1440  900
    Set Selenium Implicit Wait  2
    Go To  https://spotlab.herokuapp.com/

Fechar Navegador
    Capture Page Screenshot
    Close Browser

## Shared Steps
Então devo ver o alerta "${expected_alert}"
    Wait Until Element Is Visible   class:alert
    Element Text Should Be    class:alert   ${expected_alert}