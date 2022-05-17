Feature: Funcionario quartos
  As a funcionario do hotel
  I want to adicionar, remover, mostrar, e atualizar um quarto
  So that Eu nao tenho que fazer isso manualmente

  Scenario: criar um novo quarto corretamente
    Given existe um funcionario cadastrado com o nome 'Joao' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'joao@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'joao@gmail.com' e senha '123456'
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome 'Apartamento 3 quartos', o preco '100', a capacidade '2' e a descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo que o quarto foi salvo


  Scenario: editar quarto
    Given existe um funcionario cadastrado com o nome 'Joao' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'joao@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'joao@gmail.com' e senha '123456'
    And eu estou na pagina de quartos disponiveis
    And  o quarto de nome 'Apartamento 3 quartos', o preco '100', a capacidade '5' e a descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    When eu clico em editar quarto com o nome 'Apartamento 3 quartos'
    And edito o quarto de nome 'Apartamento 2 quartos', o preco '100', a capacidade '3' e a descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo que o quarto foi editado

  Scenario: criar um quarto sem nome
    Given existe um funcionario cadastrado com o nome 'Joao' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'joao@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'joao@gmail.com' e senha '123456'
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome '', o preco '100', a capacidade '2' e a descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo uma mensagem de nome invalido

  Scenario: criar um quarto sem descricao
    Given existe um funcionario cadastrado com o nome 'Joao' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'joao@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'joao@gmail.com' e senha '123456'
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome 'Apartamento 3 quartos', o preco '100', a capacidade '1' e a descricao ''
    Then eu vejo uma mensagem de preco invalido

  Scenario: apagar um quarto
    Given existe um funcionario cadastrado com o nome 'Joao' o sobrenome 'Victor', a data de nascimento '1980-10-02', o cpf '12345678911', o email 'joao@gmail.com', o tipo 'Funcionario', a senha '123456'  e a confirmação '123456'
    And eu estou logado no sistema com a conta com email 'joao@gmail.com' e senha '123456'
    And o quarto de nome 'Apartamento 3 quartos', o preco '100', a capacidade '3' e a descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    And eu estou na pagina de quartos disponiveis
    When  eu apago o quarto com o nome 'Apartamento 3 quartos'
    Then eu vejo uma mensagem de deletado com sucesso