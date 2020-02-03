*** Settings ***
Library     SeleniumLibrary
Library     ./libs/mongo.py

*** Keywords ***
## Hooks - Setup / Teardown
Abrir Navegador
    Open Browser    http://spotlab.herokuapp.com/   chrome
    Maximize Browser Window
    Set Selenium Implicit Wait  2

Fechar Navegador
    Capture Page Screenshot
    Close Browser

## Login Steps
Dado que "${email}" é o meu email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input Text      id:email    ${email}
    Click Element   xpath=//button[@type='submit']

Então devo ver a area logada
    Wait Until Element Is Visible   class:dashboard

Então devo ver o alerta "${expected_alert}"
    Wait Until Element Is Visible   class:alert
    Element Text Should Be    class:alert   ${expected_alert}

## Spot Steps
Logar como Admin
    Input Text      id:email    eu@gabriel.io
    Click Element   xpath=//button[@type='submit']
    Wait Until Element Is Visible   class:dashboard

Dado que eu tenho um spot disponivel na empresa "${company}"
    Set Global Variable     ${company}

Deletar Company
    remove company  ${company}

E este spot possui a imagem "${picture}"
    Set Global Variable     ${picture}

E usamos as seguintes tecnologias "${skills}"
    Set Global Variable     ${skills}

E o valor da diaria é "${price}" reais
    Set Global Variable     ${price}

Quando faço o cadastro deste spot
    Click Link    /new
    Wait Until Page Contains Element  //label[@id='thumbnail']/input
    Wait Until Element Is Visible  id:company
    Wait Until Element Is Visible  id:techs
    Wait Until Element Is Visible  id:price
    Wait Until Element Is Visible  //button[@type='submit']
    Choose File   //input[@type='file']  ${CURDIR}/img/${picture}
    Input Text    id:company  ${company}
    Input Text    id:techs  ${skills}
    Input Text    id:price  ${price}
    Click Button  //button[@type='submit']

Então devo ver o spot e a valor da diaria no dashboard
    Wait Until Element Is Visible  //ul[@class='spot-list']/li
    Element Should Contain  class:spot-list  ${company}
    Element Should Contain  class:spot-list  R$${price}/dia