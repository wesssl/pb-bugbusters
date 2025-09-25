*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${URL_CADASTRO}    https://compassuolfront.serverest.dev/cadastrarusuarios

*** Keywords ***
Abrir Página de Cadastro
    Go To    ${URL_CADASTRO}
    #Checklist 1: xpath muito abrangente
    Wait For Elements State    xpath=//h2    visible    5
    Get Text    xpath=//h2    equal    Cadastro

Preencher Formulário
    #Checklist 2: Os argumentos aqui poderiam ser um payload com um dictionary ${payload}, evitando refatorações complicadas no caso de um novo parâmetro ser necessário em novas iterações
    #[Arguments]    ${payload}
    [Arguments]    ${nome}    ${email}    ${senha}

    Fill Text    id=nome      ${nome}    #${payload}[nome]
    Fill Text    id=email     ${email}   #${payload}[email]
    Fill Text    id=password  ${senha}   #${payload}[senha]

Submeter Formulário
    Click    css=button[type=submit]
