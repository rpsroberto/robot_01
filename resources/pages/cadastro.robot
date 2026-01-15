*** Settings ***
Resource  ../main.robot

*** Variables ***
${URL}              http://localhost:3000

${CAMPO_NOME}       id:form-nome
${CAMPO_CARGO}      id:form-cargo
${CAMPO_IMAGEM}     id:form-imagem
${CAMPO_TIME}       class:lista-suspensa
${BOTAO_CARD}       id:form-botao 

@{selecionar_time}
...       //option[contains(.,'Programação')]
...       //option[contains(.,'Front-End')]
...       //option[contains(.,'Data Science')]
...       //option[contains(.,'Devops')]
...       //option[contains(.,'UX e Design')]
...       //option[contains(.,'Mobile')]
...       //option[contains(.,'Inovação')]

*** Keywords ***
Dado que eu preencha os campos do formulário
    Wait Until Element Is Visible    ${CAMPO_NOME}    timeout=5s
    
    ${Nome}=         First Name
    Input Text       ${CAMPO_NOME}       ${Nome}

    ${Cargo}=        Job
    Input Text       ${CAMPO_CARGO}      ${Cargo}

    # IMAGEM REAL 100x100 (sempre gera nova)
    ${Imagem}=       Set Variable    https://picsum.photos/100/100
    Input Text       ${CAMPO_IMAGEM}     ${Imagem}

    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_time}[0]


E clique no botão "Criar Card"
    Click Button     ${BOTAO_CARD}
    Sleep            1s


Então identificar o card no time esperado
    Wait Until Element Is Visible    class:colaborador    timeout=5s
    Element Should Be Visible        class:colaborador


Então identificar múltiplos cards
    Sleep    2s
    ${quantidade}=    Get Element Count    class:colaborador
    Should Be True    ${quantidade} >= 3


Então identificar cards em todos os times
    Sleep    3s
    ${quantidade}=    Get Element Count    class:colaborador
    Should Be True    ${quantidade} >= 7

Dado que eu clique no botao de criar card
    Click Element  ${CAMPO_CARD}

Então sistema deve exibir a mensagem de campo obrigatorio
    Element Should Be Visible  id:form-nome-erro
    Element Should Be Visible  id:form-cargo-erro
    Element Should Be Visible  id:form-times-erro
    
