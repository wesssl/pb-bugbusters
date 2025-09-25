# Testes Automatizados Web - ServeRest

## Equipe
- Squad: **Autobots**  

## Descrição do Projeto
Este projeto contém a implementação de **testes automatizados para a aplicação ServeRest** utilizando **Robot Framework** e **Browser Library**.  

O objetivo é validar funcionalidades de cadastro de usuários na aplicação web [ServeRest](https://compassuolfront.serverest.dev/), garantindo que os fluxos críticos funcionem corretamente, incluindo:

* Cadastro 
- Deve poder cadastrar um novo usuário
- Não deve permitir o cadastro com o email duplicado
- Não deve cadastrar com email inválido
- Não deve cadastrar com campos vazios - Campos obrigatórios
* Login
- Deve poder logar com um usuário pré-cadastrado
- Não deve permitir login com usuário inexistente
- Não deve logar com senha inválida
- Deve permitir fazer logout

Todos os membros da Squad devem contribuir implementando **ao menos dois casos de testes cada**.

---

## Tecnologias Utilizadas

- **Robot Framework**: framework de automação de testes.  
- **Browser Library**: para automação web moderna com Chromium/Firefox/Webkit.  
- **FakerLibrary**: geração de dados aleatórios para testes (nomes, emails, etc).  
- **JSONLibrary** e **Collections**: manipulação de dados e listas no Robot Framework.  

---

## Estrutura do Projeto
````
ServeRest-Autobots/
├── tests/
│ └── cadastro.robot
├── resources/
│ ├── pages/
│ │ └── CadastroPage.resource
│ ├── components/
│ │ └── Alert.resource
│ └── base.resource
└── README.md
````
## Como Executar os Testes

1. Instalar dependências do Robot Framework e Browser Library:

```bash
pip install robotframework
pip install robotframework-browser
rfbrowser init
pip install robotframework-faker
```
2. Navegar até a pasta do projeto:
```bash
cd /caminho/do/projeto
```
3. Executar todos os testes e salvar os logs na pasta ./logs:
```bash
robot -d ./logs ./tests
```
