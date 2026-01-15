*** Settings ***
Library    SeleniumLibrary
Resource   ../main.robot

*** Keywords ***
Dado que eu acesse o organo
    Open Browser    url=http://localhost:3000/      browser=chrome

Fechar o navegador
    Close Browser

