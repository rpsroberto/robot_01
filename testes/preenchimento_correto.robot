*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador


*** Test Cases ***
Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado
    Go To    ${URL}
    Dado que eu preencha os campos do formulário
    E clique no botão "Criar Card"
    Então identificar o card no time esperado


Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    Go To    ${URL}
    FOR    ${i}    IN RANGE    3
        Dado que eu preencha os campos do formulário
        E clique no botão "Criar Card"
    END
    Então identificar múltiplos cards


Verificar se é possível criar um card para cada time se preenchermos os campos corretamente
    Go To    ${URL}
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_time}
        Dado que eu preencha os campos do formulário
        Click Element    ${time}
        E clique no botão "Criar Card"
    END
    Então identificar cards em todos os times

