*** Settings ***

Resource    ../resources/base.robot

*** Keywords ***

Criar Massa de Dados Estática
    ${NAME}    Set Variable    Wes Lima
    ${EMAIL}    Set Variable    email@email.com
    ${PASSWORD}    Set Variable    teste123
    ${payload}    Create Dictionary    name=${NAME}    email=${EMAIL}    password=${PASSWORD}
    RETURN    ${payload}

Preencher e submeter formulário
    [Arguments]     ${payload}
    Fill Text    xpath=//*[@id="nome"]    ${payload}[name]
    Fill Text    xpath=//*[@id="email"]     ${payload}[email]
    Fill Text    xpath=//*[@id="password"]     ${payload}[password]

    Click    xpath=//button[@data-testid="cadastrar"]

Selecionar Checkbox de Administrador
    Click    xpath=//*[@data-testid="checkbox"]

Checkar se os elementos de cadastro estão visíveis
    Wait For Elements State    xpath=//*[@class="form"]   visible    3
    Get Text    xpath=//*[@class="font-robot"]    equals    Cadastro

Checkar se os Elementos de Aviso de Falha Estão Visíveis
    [Arguments]    ${mensagem}=
    Wait For Elements State    xpath=//*[@role="alert"]    visible    3
    Get Text    xpath=//*[@role="alert"]    equals   ${mensagem}

Checkar se os Elementos de Aviso de Sucesso Estão Visíveis
    [Arguments]     ${mensagem}
    Wait For Elements State    xpath=//*[@class="alert-link"]    visible    3
    Get Text    xpath=//*[@class="alert-link"]    equals   ${mensagem}


*** Test Cases ***
Deve poder cadastrar um novo usuário administrador
    [Tags]    cadastro    adm    
    Acessar URL    cadastrarusuarios
    Checkar se os elementos de cadastro estão visíveis
    ${payload}    Criar Massa de Dados Estática
    Selecionar Checkbox de Administrador
    Preencher e submeter formulário    ${payload}
    Checkar se os Elementos de Avisode Sucesso Estão Visíveis    Cadastro realizado com sucesso

Não deve criar um usuário com o mesmo email
    [Tags]    emailduplicate
    Acessar URL    cadastrarusuarios
    Checkar se os elementos de cadastro estão visíveis
    ${payload}=    Criar Massa de Dados Estática
    Preencher e submeter formulário    ${payload}
    Checkar se os Elementos de Aviso de Falha Estão Visíveis     Este email já está sendo usado 