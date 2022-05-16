Feature: Criar Conta de Cliente
  As a cliente do hotel.
  I want to criar uma conta no sistema com o e-mail e senha.
  So that eu possa acessar o sistema, editar e remover minha conta de cliente

  Scenario:criar cliente
    Given estou na pagina de cadastrar uma conta
    When eu preencho o nome 'Carlos' o sobrenome 'Andre', a data de nascimento '1980-10-02', o cpf '98765432111',o tipo 'Cliente', o email 'kanbansenior6@gmail.com', a senha '123456'  e a confirmacao '123456'
    Then eu vejo que minha conta foi criada

  Scenario:editar senha
    Given existe um clinte cadastrado com o nome 'Carlos' o sobrenome 'Andre', a data de nascimento '1980-10-02', o cpf '98765432111',o tipo 'Cliente', o email 'carlos@gmail.com', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'carlos@gmail.com' e senha '123456'
    And estou na pagina de editar cliente
    When eu coloco a nova senha '654321', a confirmação '654321' e a senha atual '123456'
    Then eu vejo uma mensagem de cliente editado com sucesso

  Scenario:criar cliente sem cpf
    Given estou na pagina de cadastrar uma conta
    When eu preencho o nome 'Carlos' o sobrenome 'Andre', a data de nascimento '1980-10-02', o cpf '',o tipo 'Cliente', o email 'kanbansenior6@gmail.com', a senha '123456'  e a confirmacao '123456'
    Then eu vejo uma mensagem de cpf invalido

  Scenario:apagar cliente
    Given existe um clinte cadastrado com o nome 'Carlos' o sobrenome 'Andre', a data de nascimento '1980-10-02', o cpf '98765432111',o tipo 'Cliente', o email 'carlinhos@gmail.com', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'Carlinhos@gmail.com' e senha '123456'
    And estou na pagina de editar cliente
    When eu clico em cancelar conta
    Then eu vejo que minha conta com o email 'Carlinhos@gmail.com' e senha '123456' foi deletada

  Scenario:criar cliente sem email
    Given estou na pagina de cadastrar uma conta
    When eu preencho o nome 'Carlos' o sobrenome 'Andre', a data de nascimento '1980-10-02', o cpf '98765432111',o tipo 'Cliente', o email '', a senha '123456'  e a confirmacao '123456'
    Then eu vejo uma mensagem sobre email invalido
