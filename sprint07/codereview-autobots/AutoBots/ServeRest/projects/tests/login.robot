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
# Checklist 2: Criar tags diferentes, em vez de ser apenas login_inexistente poderia ser:
#   [Tags]        login    inválido
    [Tags]        login_inexistente

# Checklist 1: Criar uma keyword para cada construtor de massa de dados. Um para construtor dinâmico, outro para construtor estático. Garantindo reusabilidade em outros testcases
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

    #Checklist 1
    ${user}        Create Dictionary
    ...        nome=Teste de Usuário
    ...        email=teste_de_usuario@email.com.br
    ...        senha=teste123

    Abrir Página de Login
    Preencher Formulário de Login    ${user}
    Submeter Formulário de Login
    Clicar em Logout
    Validar pagina de login        Login