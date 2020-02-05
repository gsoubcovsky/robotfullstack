*** Settings ***
Resource    ./base.robot
Library     SeleniumLibrary

*** Keywords ***
Dado que "${email}" é o meu email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input Text      id:email    ${email}
    Click Element   xpath=//button[@type='submit']

Então devo ver a area logada
    Wait Until Element Is Visible   class:dashboard