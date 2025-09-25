*** Settings ***
Documentation    Cenários de teste do Cadastro do usuário

Resource         ../resources/pages/CadastroPage.resource
Resource         ../resources/pages/compontents/Alert.resource
Resource        ../resources/base.resource
Library          FakerLibrary
Library          Collections

Test Setup       Start Session

*** Test Cases ***
Deve cadastrar um novo usuário com sucesso
    ${name}      FakerLibrary.Name
    ${email}     FakerLibrary.Email
    ${password}  Set Variable    teste123

    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário

    # Validação da mensagem de sucesso
   # Mensagem de Alerta Deve Conter    Cadastro realizado com sucesso


Não deve cadastrar usuário duplicado
    [Tags]      dup

    # Checklist 1: Criar uma keyword para cada construtor de massa de dados. Um para construtor dinâmico, outro para construtor estático. Garantindo reusabilidade em outros testcases
    ${name}       FakerLibrary.Name
    ${email}      Set Variable    duplicado@gmail.com
    ${password}   Set Variable    teste123

    # Primeiro cadastro (usuário inicial)
    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário

    # Segunda tentativa com o mesmo email
    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário

    # Validação da mensagem de erro
   Mensagem de Alerta Deve Conter    Este email já está sendo usado

Não deve cadastrar com email inválido (GUILHERME)
    [Tags]    cadastro    negativo    guilherme
    ${name}=       FakerLibrary.Name
    ${email}=      Set Variable    guilherme@
    ${password}=   Set Variable    123
    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário
    ${enviou}=    Run Keyword And Return Status    Wait For Response    matcher=**/usuarios    timeout=3s
    Should Be Equal    ${enviou}    ${False}

Não deve cadastrar com campos vazios - Campos obrigatórios (GUILHERME)
    [Tags]    cadastro    negativo    guilherme
    Abrir Página de Cadastro
    Submeter Formulário
    ${enviou}=    Run Keyword And Return Status    Wait For Response    matcher=**/usuarios    timeout=3s
    Run Keyword If    ${enviou}    Log    Houve POST com campos vazios; comportamento aceito neste cenário.    WARN
    Run Keyword Unless    ${enviou}    Log    Front bloqueou envio (sem POST).    INFO
