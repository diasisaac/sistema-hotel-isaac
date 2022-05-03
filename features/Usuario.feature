Feature: Usuário
  As a usuário do sistema.
  I want to criar uma conta, excluir ela, editar dados pessoais e entrar no sistema
  So that eu possa ter acesso e manipulação da minha conta.

  Scenario:Criar conta corretamente
    Given estou na pagina de criar conta
    When eu preencho o email 'Erik@gmail.com', a senha '123456' e a confirmação de senha '123456'
    Then eu vejo que a conta foi criada com sucesso

  Scenario:Criar conta com senha invalida
    Given estou na pagina de criar conta
    When eu preencho o email 'Erik@gmail.com', a senha '123' e a confirmação de senha '123'
    Then eu vejo uma mensagem de senha invalida


  Scenario:Criar conta com senhas diferentes
    Given estou na pagina de criar conta
    When eu preencho o email 'Erik@gmail.com', a senha '123456' e a confirmação de senha 'abcdef'
    Then eu vejo uma mensagem de senha invalida

  Scenario:Criar uma conta vazia
    Given estou na pagina de criar conta
    When eu preencho o email '', a senha '' e a confirmação de senha ''
    Then eu vejo uma mensagem de erro

  Scenario:Criar conta sem email
    Given estou na pagina de criar conta
    When eu preencho o email '', a senha '123456' e a confirmação de senha '123456'
    Then eu vejo uma mensagem de email invalido