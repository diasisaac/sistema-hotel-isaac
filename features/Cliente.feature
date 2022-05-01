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

  Scenario:apagar cliente
    Given estou na pagina de clientes
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    When clico em deletar cliete
    Then eu vejo que o cliente foi deletado

  Scenario:criar cliente sem email
    Given estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email ''
    Then eu vejo uma mensagem de email invalido

  Scenario:editar cliente
    Given estou na pagina de clientes
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    When eu edito com o nome 'Marcos Felipe', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com'
    Then eu vejo uma mensagem de cliente editado com sucesso
