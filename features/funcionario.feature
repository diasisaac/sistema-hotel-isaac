
Feature: Funcionario
  As a funcionario do hotel
  I want to adicionar, remover, mostrar, e atualizar um quarto
  So that Eu nao tenho que fazer isso manualmente

  Scenario: criar um novo quarto corretamente
    Given a conta com email 'kanbansenior1@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo que o quarto de nome 'Apartamento 3 quartos' foi salvo


  Scenario: editar quarto
    Given a conta com email 'kanbansenior2@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And eu estou na pagina de quartos
    And o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    When eu vou para página de editar quarto e edito o quarto de nome 'Apartamento 3 quartos' e andar '3' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo que o quarto de nome 'Apartamento 3 quartos' foi editado

  Scenario: criar um quarto sem nome
    Given a conta com email 'kanbansenior3@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome '' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo uma mensagem de erro de invalidez

  Scenario: criar um quarto sem andar
    Given a conta com email 'kanbansenior4@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome 'Apartamento 3 quartos' e andar '' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo uma mensagem de erro de invalidez

  Scenario: criar um quarto sem descricao
    Given a conta com email 'kanbansenior5@gmail.com' e senha '1234567kanban' existe
    And eu estou logado no sistema
    And eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome 'Apartamento 3 quartos' e andar '3' e diaria '100' e capacidade '5' e descricao ''
    Then eu vejo uma mensagem de erro de invalidez