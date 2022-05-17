Feature: Conta do funcionario
  As a usuário do sistema.
  I want to criar uma conta, excluir ela, editar dados pessoais e entrar no sistema
  So that eu possa ter acesso e manipulação da minha conta.

  Scenario:criar funcionario
    Given estou na pagina de cadastrar uma conta
    When eu preencho o nome 'joão' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911',o tipo 'Funcionario', o email 'Victor33@gmail.com', a senha '123456'  e a confirmacao '123456'
    Then eu vejo que funcionario com o email 'Victor33@gmail.com' foi criado

  Scenario:editar senha
    Given existe um funcionario cadastrado com o nome 'João' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'Victor2@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'Victor2@gmail.com' e senha '123456'
    And estou na pagina de editar cliente
    When eu coloco a nova senha '654321', a confirmação '654321' e a senha atual '123456'
    Then eu vejo uma mensagem de funcionaio editado com sucesso

  Scenario:criar funcionario sem cpf
    Given estou na pagina de cadastrar uma conta
    When eu preencho o nome 'joão' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '',o tipo 'Funcionario', o email 'Victor33@gmail.com', a senha '123456'  e a confirmacao '123456'
    Then eu vejo uma mensagem de cpf invalido

  Scenario:apagar funcionario
    Given existe um funcionario cadastrado com o nome 'João' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'Victor3@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'Victor3@gmail.com' e senha '123456'
    And estou na pagina de editar funcionario
    When eu clico em cancelar conta
    Then eu vejo que minha conta com o email 'Victor3@gmail.com' e senha '123456' foi deletada

  Scenario:criar funcionario sem email
    Given estou na pagina de cadastrar uma conta
    When eu preencho o nome 'joão' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911',o tipo 'Funcionario', o email '', a senha '123456'  e a confirmacao '123456'
    Then eu vejo uma mensagem sobre email invalido
