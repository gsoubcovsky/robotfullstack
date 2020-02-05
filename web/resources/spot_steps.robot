*** Settings ***
Resource    ./base.robot
Library     ./libs/mongo.py

*** Keywords ***
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
    Run Keyword if  "${picture}"
    ...             Choose File   //input[@type='file']  ${CURDIR}/img/${picture}
    Input Text    id:company  ${company}
    Input Text    id:techs  ${skills}
    Input Text    id:price  ${price}
    Click Button  //button[@type='submit']

Então devo ver o spot e a valor da diaria no dashboard
    Wait Until Element Is Visible  //ul[@class='spot-list']/li
    Element Should Contain  class:spot-list  ${company}
    Element Should Contain  class:spot-list  R$${price}/dia