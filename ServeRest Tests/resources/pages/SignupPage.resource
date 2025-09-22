*** Settings ***
Documentation       Elementos e açôes da página de cadastro
Library             Browser
Resource            ../env.resource

*** Keywords ***
Go to signup page
    Go To                       ${BASE_URL}/cadastrarusuarios
    Wait for Elements State     css=h2      visible     5
    Get Text                    css=h2      equal       Cadastro

Submit signup form
    [Arguments]     ${user}

    Fill Text       css=input[name=nome]            ${user}[name]
    Fill Text       css=input[name=email]           ${user}[email]
    Fill Text       css=input[name=password]        ${user}[password]
    Click           css=button[type=submit] >> text=Cadastrar