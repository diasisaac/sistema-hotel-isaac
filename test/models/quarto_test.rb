require "test_helper"

class QuartoTest < ActiveSupport::TestCase
  test "criando quarto" do
    quarto = Quarto.new(nome: 'Apartamento de 2 Quartos', andar:'5', diaria: '100', capacidade: '5',descricao:'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito')
    assert quarto.save
  end
  test "criando quarto sem nome" do
    quarto = Quarto.new(nome: '', andar:'5', diaria: '100', capacidade: '5',descricao:'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito')
    assert_not quarto.save
  end

  test "editando quarto" do
    quarto = Quarto.new(nome: 'Apartamento de 2 Quartos', andar:'5', diaria: '100', capacidade: '5',descricao:'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito')
    quarto.save
    assert quarto.update(nome: 'Apartamento de 2 Quartos', andar:'8', diaria: '100', capacidade: '5',descricao:'Cozinha privativa, Banheiro privativo, Ar-condicionado e WiFi Gratuito')
  end


end
