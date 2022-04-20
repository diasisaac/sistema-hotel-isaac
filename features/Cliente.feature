Feature: Cliente
  As a cliente do hotel
  I want to criar, entrar, editar e apagar uma conta
  So that eu possa usar o sistema

  Scenario:criar cliente
    Given estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com'
    Then eu vejo que cliente com o cpf '98765432111' foi criado

  Scenario:criar cliente sem cpf
    Given estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '', o email 'Carlos@gmail.com'
    Then eu vejo uma mensagem de cpf invalido