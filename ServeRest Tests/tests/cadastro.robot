*** Settings ***
Documentation       Cenários de teste do cadastro do usuário
Resource            ../resources/base.resource
Library             FakerLibrary

Test Setup          Start Session
Test Teardown       Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuario
    [Tags]              cadastro

    ${FAKE_NAME}        FakerLibrary.Name
    ${FAKE_EMAIL}       FakerLibrary.Email
    ${FAKE_PASSWORD}    FakerLibrary.Password
    
    ${user}             Create Dictionary
    ...                 name=${FAKE_NAME}
    ...                 email=${FAKE_EMAIL}
    ...                 password=${FAKE_PASSWORD}

    Go to signup page
    Submit signup form                  ${user}
    Notice should be                    Serverest Store

Não deve permitir o cadastro com email duplicado
    [Tags]              duplicado

    ${user}             Create Dictionary
    ...                 name=Bruno
    ...                 email=bruno@gmail.com
    ...                 password=181409

    Go to signup page
    Submit signup form                  ${user}
    Submit signup form                  ${user}
    Notice should be error              Este email já está sendo usado