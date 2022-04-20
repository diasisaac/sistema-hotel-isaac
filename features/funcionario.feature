
Feature: Funcionario
  As a funcionario do hotel
  I want to adicionar, remover, mostrar, e atualizar um quarto
  So that Eu nao tenho que fazer isso manualmente

  Scenario: criar um novo quarto corretamente
    Given eu estou na pagina de criar novo quarto
    When  eu crio um quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo que o quarto foi salvo


  Scenario: editar quarto
    Given eu estou na pagina de quartos
    And o quarto de nome 'Apartamento 3 quartos' existe
    When eu edito o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito'
    Then eu vejo que o quarto foi editado

