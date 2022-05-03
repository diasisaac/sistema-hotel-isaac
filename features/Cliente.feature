Feature: Cliente
  As a cliente do hotel
  I want to criar, entrar, editar e apagar uma conta
  So that eu possa usar o sistema

  Scenario:criar cliente
    Given a conta com email 'kanbansenior@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' e usuario '1'
    Then eu vejo que cliente com o email 'Carlos@gmail.com' foi criado

  Scenario:editar cliente
    Given a conta com email 'kanbansenior@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And estou na pagina de clientes
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' e usuario '1' existe
    When eu edito o nome 'Marcos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' e usuario '1'
    Then eu vejo uma mensagem de cliente editado com sucesso

  Scenario:criar cliente sem cpf
    Given a conta com email 'kanbansenior@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '', o email 'Carlos@gmail.com' e usuario '1'
    Then eu vejo uma mensagem de cpf invalido

  Scenario:apagar cliente
    Given a conta com email 'kanbansenior@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And estou na pagina de clientes
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' e usuario '1' existe
    When clico em deletar cliete
    Then eu vejo que o cliente foi deletado

  Scenario:criar cliente sem email
    Given a conta com email 'kanbansenior@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And estou na pagina de criar um novo cliente
    When eu preencho o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '', o email '' e usuario '1'
    Then eu vejo uma mensagem sobre email invalido
