*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${URL_LOGIN}    https://compassuolfront.serverest.dev/login

*** Keywords ***

Abrir Página de Login
    Go To    ${URL_LOGIN}
    #Checklist 1: xpath muito abrangente
    Wait For Elements State    xpath=//h1    visible    5
    Get Text    xpath=//h1    equal    Login

Preencher Formulário de Login
    [Arguments]    ${user}
    Fill Text    id=email     ${user}[email]
    Fill Text    id=password  ${user}[senha]

Submeter Formulário de Login
    Click    css=button[type=submit]

Validar texto de alerta
    [Arguments]    ${texto_esperado}
    Wait For Elements State    xpath=//span[text()="Email e/ou senha inválidos"]    visible    5
    ${mensagem}    Get Text    xpath=//span[text()="Email e/ou senha inválidos"]
    Should Contain    ${mensagem}    ${texto_esperado}

Clicar em Logout
    #Checklist 2: checar se há uma xpath mais diminuta
    Click    xpath=//*[@id="navbarTogglerDemo01"]/form/button

Validar pagina de login
     [Arguments]    ${texto_esperado}
    #Checklist 3: xpath muito abrangente
    Wait For Elements State    xpath=//h1   visible    5
    ${mensagem}    Get Text    xpath=//h1
    Should Contain    ${mensagem}    ${texto_esperado}