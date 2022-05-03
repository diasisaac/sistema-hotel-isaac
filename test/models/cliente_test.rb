require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  test "criando cliente" do
    cliente = Cliente.new(nome: 'Carlos Andre', data_de_nascimento: '1980-10-02', cpf: '98765432111', email: 'Carlos@gmail.com')
    assert cliente.save
  end
  test "criando cliente sem nome" do
    cliente = Cliente.new(nome: '', data_de_nascimento: '1980-10-02', cpf: '98765432111', email: 'Carlos@gmail.com')
    assert_not cliente.save
  end
  test "editando cliente" do
    cliente = Cliente.new(nome: 'Carlos Andre', data_de_nascimento: '1980-10-02', cpf: '98765432111', email: 'Carlos@gmail.com')
    assert cliente.save
    assert cliente.update(nome: 'João Paulo', data_de_nascimento: '1980-10-02', cpf: '98765432111', email: 'Carlos@gmail.com')
  end
end
