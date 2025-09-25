### Squad que realiou o CR: BugBusters
### Squad que recebeu o CR: AutoBots

---

- [ ] 1 - Replicação de código desnecessária 
- Nos arquivos `LoginPage.robot` e `CadastroPage.robot` está repetindo o a url da aplicação.

#### Sugestão:
- Cria um arquivo `env.resource` na pasta `resources` onde contém:
```php
    *** Settings ***
    Documentation       Variáveis globais e configuração de ambiente
    
    *** Variables ***
    ${BASE_URL}     https://front.serverest.dev
```

- E no `base.resource` na pasta `resources`, passe a variavel `${BASE_URL}`:
```php
    *** Keywords ***
    Start Session
        New Browser     browser=chromium    headless=False
        New Page        ${BASE_URL}
```

- Ajuste `LoginPage.robot`:
```php
    *** Settings ***
    Resource            ../env.resource
    
    *** Keywords ***
    Abrir Página de Login
        Go To           ${BASE_URL}/login
        Wait For        Elements State    xpath=//h1    visible    5
        Get Text        xpath=//h1    equal    Login
```

- Ajuste também o arquivo `CadastroPage.robot`:
```php
    *** Settings ***
    Resource            ../env.resource
    
    *** Keywords ***
    Abrir Página de Cadastro
        Go To           ${BASE_URL}/cadastrarusuarios
        Wait For        Elements State    xpath=//h2    visible    5
        Get Text        xpath=//h2    equal    Cadastro
```

- [ ] 2 - Replicação XPATH
- Tem arquivos que tem o mesmo padrão de XPATH, mudando apenas o texto presente no elemento.

#### Sugestão:
- No arquivo `Alert.resource` tem o trecho:
```
    xpath=//span[text()="Este email já está sendo usado"]
```

- No arquivo `LoginPage.robot` tem o trecho:
```
    xpath=//span[text()="Email e/ou senha inválidos"]
```

- Criar uma keyword no arquivo `Alert.resource` passando o texto de validação como argumento.
```
*** Settings ***
Library    Browser

*** Keywords ***
Mensagem de Alerta Deve Conter
    [Arguments]    ${xpath}    ${texto_esperado}
    Wait For Elements State    ${xpath}    visible    5
    ${mensagem}    Get Text    ${xpath}
    Should Contain    ${mensagem}    ${texto_esperado}
```

- Aplique nos arquivos:
```
LoginPage.robot
Mensagem de Alerta Deve Conter      xpath=//span[text()="Email e/ou senha inválidos"]         Email e/ou senha inválidos
```

- [ ] 3 - Reduzir repetição no fluxo de cadastro
- No arquivo `cadastro.robot` tem:
```
*** Test Cases ***
Deve cadastrar um novo usuário com sucesso
    ${name}      FakerLibrary.Name
    ${email}     FakerLibrary.Email
    ${password}  Set Variable    teste123

    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário
```

- No arquivo `CadastroPage.resource` crie uma nova keyword:
``` 
Cadastrar Usuário
    [Arguments]    ${payload}
    Abrir Página de Cadastro
    Preencher Formulário    ${payload}[name]    ${payload}[email]    ${payload}[password]
    Submeter Formulário
```

E no teste ficaria:
```
*** Test Cases ***
Deve cadastrar um novo usuário com sucesso
    ${name}      FakerLibrary.Name
    ${email}     FakerLibrary.Email
    ${password}  Set Variable    teste123

    &{payload}   Create Dictionary
    ...          name=${name}
    ...          email=${email}
    ...          password=${password}

    Cadastrar Usuário    ${payload}
```

### As sugestões não foram dividamente testadas, se forem acatadas, apliquem como exemplo para a melhoria do código de vocês.
