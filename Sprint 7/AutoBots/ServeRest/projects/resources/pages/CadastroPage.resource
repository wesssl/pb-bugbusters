*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${URL_CADASTRO}    https://compassuolfront.serverest.dev/cadastrarusuarios

*** Keywords ***
Abrir Página de Cadastro
    Go To    ${URL_CADASTRO}
    Wait For Elements State    xpath=//h2    visible    5
    Get Text    xpath=//h2    equal    Cadastro

Preencher Formulário
    [Arguments]    ${nome}    ${email}    ${senha}
    Fill Text    id=nome      ${nome}
    Fill Text    id=email     ${email}
    Fill Text    id=password  ${senha}

Submeter Formulário
    Click    css=button[type=submit]
