require "test_helper"

class ReservaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'nao deveria salvar reserva sem atributos' do
    reserva = Reserva.new
    assert_not reserva.save
  end

  test 'deveria salvar reserva com atributos validos' do

    quarto = Quarto.new(nome: 'Apartamento de 2 Quartos', andar:'5', diaria: '100', capacidade: '5',descricao:'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito')
    assert quarto.save

    cliente = Cliente.new(nome: 'Carlos Andre', data_de_nascimento: '1980-10-02', cpf: '98765432111', email: 'Carlos@gmail.com')
    assert cliente.save

    reserva = Reserva.new(check_in:"2022-05-01", checkout: "2022-05-02", cliente_id: cliente.id, quarto_id: quarto.id, numero_adultos: 2, numero_criancas: 0, pedidos:"cucuz com ovo e café")

    assert reserva.save
  end

  test 'nao deveria salvar reserva sem cliente' do

    quarto = Quarto.new(nome: 'Apartamento de 2 Quartos', andar:'5', diaria: '100', capacidade: '5',descricao:'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito')
    assert quarto.save

    cliente = Cliente.new(nome: 'João Carlos', data_de_nascimento: '1980-10-02', cpf: '98765432111', email: 'Carlos@gmail.com')
    assert cliente.save

    reserva = Reserva.new(check_in:"2022-05-01" , checkout: "2022-05-02", cliente_id: nil, quarto_id: quarto.id, numero_adultos: 2, numero_criancas: 0, pedidos:"cucuz com ovo e café")

    assert_not reserva.save
  end

end
