*** Settings ***
Documentation    Cenários de teste do Cadastro do usuário

Resource         ../resources/pages/CadastroPage.resource
Resource         ../resources/pages/compontents/Alert.resource
Resource        ../resources/base.resource
Resource    ../resources/pages/LoginPage.robot
Library          FakerLibrary
Library          Collections

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
    
Não deve permitir login com usuário inexistente (RENAN)
    [Tags]        login_inexistente

    ${user}        Create Dictionary
    ...        nome=Teste de Usuário Inexistente
    ...        email=teste_de_usuario_inexistente@email.com.br
    ...        senha=teste123

    Abrir Página de Login
    Preencher Formulário de Login    ${user}
    Submeter Formulário de Login
    Validar texto de alerta        Email e/ou senha inválidos
    
Fazer logout (RENAN)
    [Tags]        logout

    ${user}        Create Dictionary
    ...        nome=Teste de Usuário
    ...        email=teste_de_usuario@email.com.br
    ...        senha=teste123

    Abrir Página de Login
    Preencher Formulário de Login    ${user}
    Submeter Formulário de Login
    Clicar em Logout
    Validar pagina de login        Login