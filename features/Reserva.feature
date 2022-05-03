Feature: Reserva
  As a funcionário do hotel
  I want to listar as reservas, editar as reservas e remover as reservas.
  So that eu gerencie as reservas do hotel

  Scenario: Criar reserva corretamente
    Given o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    And eu estou na pagina de criar reserva
    When eu preencho a reserva como check_in "2022-05-05", checkout "2022-05-10", cliente_id "Carlos Andre", quarto_id "Apartamento 3 quartos", numero_adultos '2', numero_criancas: '0', pedidos "cucuz com ovo e café"
    And eu clico em criar reserva
    Then eu vejo uma mensagem que a reserva com o quarto "Apartamento 3 quartos" foi criada

  Scenario: Editar reserva corretamente
    Given o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    And a reserva com check_in "2022-05-05", checkout "2022-05-10", cliente_id "Carlos Andre", quarto_id "Apartamento 3 quartos", numero_adultos '2', numero_criancas: '0', pedidos "cucuz com ovo e café" existe
    And eu estou na pagina da reserva com cliente_id 'Carlos Andre' e quarto_id 'Apartamento 3 quartos'
    When eu edito com check_in "2022-06-06", checkout "2022-06-10", cliente_id "Carlos Andre", quarto_id "Apartamento 3 quartos", numero_adultos '2', numero_criancas: '0', pedidos "cucuz com ovo e café"
    And eu clico em editar reserva
    Then eu vejo uma mensagem que a reserva com o quarto "Apartamento 3 quartos" foi editada

  Scenario: Criar reserva sem datas
    And o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    And eu estou na pagina de criar reserva
    When eu preencho a reserva como check_in "", checkout "", cliente_id "Carlos Andre", quarto_id "Apartamento 3 quartos", numero_adultos '2', numero_criancas: '0', pedidos "cucuz com ovo e café"
    And eu clico em criar reserva
    Then eu vejo uma mensagem de erro na reserva

  Scenario: Remover reserva corretamente
    Given o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    And a reserva com check_in "2022-05-05", checkout "2022-05-10", cliente_id "Carlos Andre", quarto_id "Apartamento 3 quartos", numero_adultos '2', numero_criancas: '0', pedidos "cucuz com ovo e café" existe
    And eu estou na pagina da reserva com cliente_id 'Carlos Andre' e quarto_id 'Apartamento 3 quartos'
    When eu clico em apagar reserva
    Then eu vejo que a reserva foi deletada

  Scenario: Listar reserva corretamente
    Given o quarto de nome 'Apartamento 3 quartos' e andar '5' e diaria '100' e capacidade '5' e descricao 'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito' existe
    And o cliente com o nome 'Carlos Andre', a data de nascimento '1980-10-02', o cpf '98765432111', o email 'Carlos@gmail.com' existe
    And a reserva com check_in "2022-05-05", checkout "2022-05-10", cliente_id "Carlos Andre", quarto_id "Apartamento 3 quartos", numero_adultos '2', numero_criancas: '0', pedidos "cucuz com ovo e café" existe
    When eu clico no link para ver as reservas
    Then eu vejo as reservas listadas