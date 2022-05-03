Feature: Cliente
  As a cliente do hotel
  I want to criar, entrar, editar e apagar uma conta
  So that eu possa usar o sistema

  Scenario:criar cliente sem cpf
    Given estou cadastrado no sistema com o email 'Erik@gmail.com', a senha '123456' e a confirmação de senha '123456'
    And estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '', o email 'Carlos@gmail.com'
    Then eu vejo uma mensagem de cpf invalido

  Scenario:criar cliente sem email
    Given estou cadastrado no sistema com o email 'Erik@gmail.com', a senha '123456' e a confirmação de senha '123456'
    And estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email ''
    Then eu vejo uma mensagem de email invalido

