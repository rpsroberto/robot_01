*** Settings ***
Resource        ../resources/main.robot
Test Setup      Dado que eu acesse o organo
Test Teardown   Fechar o navegador

*** Variables ***
${CAMPO_CARD}             id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatorio
    Dado que eu clique no botao de criar card
    Então sistema deve exibir a mensagem de campo obrigatorio
